import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:madani/src/index.dart';
import 'package:madani/src/madani_repos/question_page/form_answer_mapper.dart';

part 'questions_event.dart';
part 'questions_state.dart';
part 'questions_bloc.freezed.dart';
part 'questions_bloc.g.dart';

class QuestionsBloc extends HydratedBloc<QuestionsEvent, QuestionsState> {
  // Store value-label mapping for displaying labels while storing values
  Map<String, Map<String, String>> _valueLabelMapping = {}; // criteriaRefId -> (value -> label)
  
  Map<String, String>? getLabelMapping(String criteriaRefId) {
    return _valueLabelMapping[criteriaRefId];
  }
  
  String? getLabel(String criteriaRefId, String value) {
    return _valueLabelMapping[criteriaRefId]?[value] ?? value;
  }
  
  QuestionsBloc() : super(QuestionsState.initial()) {
    // on<GetQuestion>(_getQuestion); // Removed - API not used
    on<LoadStaticQuestions>(_loadStaticQuestions);
    on<StoreAnswer>(_storeAnswer);
    on<InitialValueAnswer>(_initialValueAnswer);
    on<CheckBoxAnswer>(_checkBoxAnswer);
    on<SearchResults>(_searchResults);
    on<GetArticlesByKategori>(_getArticlesByKategori);
    on<ResetStatus>(_resetStatus);
  }

  // Removed _getQuestion method - API getQuestions() not used
  // Future<void> _getQuestion(
  //     GetQuestion event, Emitter<QuestionsState> emit) async {
  //   try {
  //     emit(state.copyWith(status: QuestionStatus.loading));
  //
  //     Pagination<QuestionModel> questions =
  //         await QuestionsRepo().getQuestions(page: event.page);
  //
  //     final List<QuestionModel> newQuestions =
  //         event.page >= 2 ? [...state.question.data] : [];
  //
  //     emit(state.copyWith(
  //       status: QuestionStatus.completed,
  //       question: questions.copyWith(
  //         data: [
  //           ...newQuestions,
  //           ...questions.data,
  //         ],
  //       ),
  //     ));
  //   } on StateException catch (e) {
  //     emit(state.copyWith(
  //         errorMessage: 'Error getting questions: $e',
  //         status: QuestionStatus.error));
  //   } catch (e, stackTrace) {
  //     log('Error getting questions: $e\n$stackTrace', error: e);
  //     emit(state.copyWith(
  //         errorMessage: 'Error getting questions: $e',
  //         status: QuestionStatus.error));
  //   }
  // }

  Future<void> _loadStaticQuestions(
      LoadStaticQuestions event, Emitter<QuestionsState> emit) async {
    try {
      emit(state.copyWith(status: QuestionStatus.loading));
      
      // Fetch questions from API with value-label mapping
      final result = await QuestionsRepo().getFormQuestions();
      
      // Store value-label mapping in bloc
      _valueLabelMapping = result.valueLabelMapping;
      
      // Initialize answers and checkbox arrays
      final initialAnswers = List<String>.filled(result.questions.data.length, '');
      final initialCheckBoxAnswer = List.generate(
        result.questions.data.length,
        (index) => AnswerModel(
          id: result.questions.data[index].criteriaRefId,
          answer: [],
        ),
      );
      final initialCheckboxQuestion = List.generate(
        result.questions.data.length,
        (_) => <String>[],
      );

      emit(state.copyWith(
        status: QuestionStatus.completed,
        question: result.questions,
        answers: initialAnswers,
        checkBoxAnswer: initialCheckBoxAnswer,
        checkboxQuestion: initialCheckboxQuestion,
        answerCount: 0,
      ));
    } on StateException catch (e) {
      developer.log('Error loading questions from API: $e', error: e);
      emit(state.copyWith(
          errorMessage: 'Error loading questions: $e',
          status: QuestionStatus.error));
    } catch (e, stackTrace) {
      developer.log('Error loading questions from API: $e\n$stackTrace', error: e);
      emit(state.copyWith(
          errorMessage: 'Error loading questions: $e',
          status: QuestionStatus.error));
    }
  }

  void _storeAnswer(StoreAnswer event, Emitter<QuestionsState> emit) {
    print('LOGAPP BLOC: ========== STORE ANSWER START ==========');
    print('LOGAPP BLOC: Answer Index: ${event.answerIndex}');
    print('LOGAPP BLOC: Answer ID: ${event.id}');
    print('LOGAPP BLOC: Question Answer: ${event.questionAnswer}');
    print('LOGAPP BLOC: Answer Model: ${event.answer}');
    
    final List<AnswerModel> updatedCheckBoxAnswer =
        List<AnswerModel>.from(state.checkBoxAnswer);
    final List<String> updatedAnswers = List<String>.from(state.answers);
    int updatedAnsweredCount = state.answerCount;
    
    print('LOGAPP BLOC: Current Answer Count: $updatedAnsweredCount');
    print('LOGAPP BLOC: Current Answers Length: ${updatedAnswers.length}');
    print('LOGAPP BLOC: Current CheckBox Answer Length: ${updatedCheckBoxAnswer.length}');

    // Handle checkbox answers
    if (state.question.data[event.answerIndex].answerType == 'checkbox') {
      print('LOGAPP BLOC: Processing CHECKBOX answer type');
      List<String> selectedOptions =
          List<String>.from(updatedCheckBoxAnswer[event.answerIndex].answer);
      print('LOGAPP BLOC: Current Selected Options: $selectedOptions');
      
      if (selectedOptions.contains(event.questionAnswer)) {
        print('LOGAPP BLOC: Removing option: ${event.questionAnswer}');
        selectedOptions.remove(event.questionAnswer);
        if (selectedOptions.isEmpty) {
          updatedAnsweredCount--;
          print('LOGAPP BLOC: Answer count decreased to: $updatedAnsweredCount');
        }
      } else {
        print('LOGAPP BLOC: Adding option: ${event.questionAnswer}');
        selectedOptions.add(event.questionAnswer);
        if (selectedOptions.length == 1) {
          updatedAnsweredCount++;
          print('LOGAPP BLOC: Answer count increased to: $updatedAnsweredCount');
        }
      }
      print('LOGAPP BLOC: Updated Selected Options: $selectedOptions');
      updatedCheckBoxAnswer[event.answerIndex] =
          AnswerModel(id: event.id, answer: selectedOptions);
      updatedAnswers[event.answerIndex] =
          selectedOptions.isEmpty ? '' : selectedOptions.join(', ');
    } else {
      print('LOGAPP BLOC: Processing ${state.question.data[event.answerIndex].answerType} answer type');
      // Handle other types of answers
      if (event.answerIndex >= updatedAnswers.length ||
          event.answerIndex >= updatedCheckBoxAnswer.length) {
        print('LOGAPP BLOC: Expanding arrays to accommodate index ${event.answerIndex}');
        while (updatedAnswers.length <= event.answerIndex ||
            updatedCheckBoxAnswer.length <= event.answerIndex) {
          updatedAnswers.add('');
          updatedCheckBoxAnswer.add(AnswerModel(id: '', answer: ['']));
        }
        print('LOGAPP BLOC: Arrays expanded - Answers: ${updatedAnswers.length}, CheckBox: ${updatedCheckBoxAnswer.length}');
      }
      
      final previousAnswer = updatedAnswers[event.answerIndex];
      print('LOGAPP BLOC: Previous Answer at index ${event.answerIndex}: $previousAnswer');
      
      if (previousAnswer.isEmpty &&
          event.questionAnswer.isNotEmpty) {
        updatedAnsweredCount++;
        print('LOGAPP BLOC: Answer count increased to: $updatedAnsweredCount');
      } else if (previousAnswer.isNotEmpty &&
          event.questionAnswer.isEmpty) {
        updatedAnsweredCount--;
        print('LOGAPP BLOC: Answer count decreased to: $updatedAnsweredCount');
      }
      updatedAnswers[event.answerIndex] = event.questionAnswer;
      updatedCheckBoxAnswer[event.answerIndex] = event.answer;
      print('LOGAPP BLOC: Updated Answer at index ${event.answerIndex}: ${event.questionAnswer}');
    }

    emit(
      state.copyWith(
        checkBoxAnswer: updatedCheckBoxAnswer,
        answers: updatedAnswers,
        answerCount: updatedAnsweredCount,
      ),
    );
    print('LOGAPP BLOC: State updated - Final Answer Count: $updatedAnsweredCount');
    print('LOGAPP BLOC: Final CheckBox Answers: $updatedCheckBoxAnswer');
    print('LOGAPP BLOC: Final Answers: $updatedAnswers');
    print('LOGAPP BLOC: ========== STORE ANSWER END ==========');
    developer.log('LOGAPP BLOC: data model: $updatedCheckBoxAnswer');
    developer.log('LOGAPP BLOC: answered count: $updatedAnsweredCount');
  }

  void _initialValueAnswer(
      InitialValueAnswer event, Emitter<QuestionsState> emit) {
    print('LOGAPP BLOC: ========== INITIAL VALUE ANSWER START ==========');
    print('LOGAPP BLOC: Total Questions: ${state.question.data.length}');
    print('LOGAPP BLOC: Current Answer Count: ${state.answerCount}');
    print('LOGAPP BLOC: Current CheckBox Answer Count: ${state.checkBoxAnswer.length}');
    print('LOGAPP BLOC: Current CheckBox Answers: ${state.checkBoxAnswer}');
    
    final initialData = List<String>.filled(state.question.data.length, '');
    final updateCheckboxQuestion = List.generate(
      state.question.data.length,
      (_) => <String>[],
    );
    
    // Reset checkBoxAnswer to initial state - this is used to send data to API
    // Create new AnswerModel with empty answer array for each question
    // Use List.from() to ensure we create a completely new list, not a reference
    final initialCheckBoxAnswer = List<AnswerModel>.from(
      List.generate(
        state.question.data.length,
        (index) => AnswerModel(
          id: state.question.data[index].criteriaRefId,
          answer: <String>[], // Empty list - this ensures answer.answer.isEmpty will be true
        ),
      ),
    );

    for (var i = 0; i < state.question.data.length; i++) {
      if (state.question.data[i].answerType == 'checkbox') {
        updateCheckboxQuestion[i] = [];
      }
    }

    print('LOGAPP BLOC: Reset CheckBox Answer Count: ${initialCheckBoxAnswer.length}');
    print('LOGAPP BLOC: Reset CheckBox Answers: $initialCheckBoxAnswer');
    print('LOGAPP BLOC: Verifying all answers are empty...');
    for (var i = 0; i < initialCheckBoxAnswer.length; i++) {
      final answer = initialCheckBoxAnswer[i];
      if (answer.answer.isNotEmpty) {
        print('LOGAPP BLOC: WARNING - Answer at index $i is NOT empty: ${answer.answer}');
      }
    }

    emit(state.copyWith(
      status: QuestionStatus.stop,
      answers: initialData,
      answerCount: 0,
      checkboxQuestion: updateCheckboxQuestion,
      checkBoxAnswer: initialCheckBoxAnswer, // Reset checkBoxAnswer to clear previous answers
      searchResults: [], // Clear search results
      pieChartData: null, // Clear pie chart data
    ));
    
    print('LOGAPP BLOC: State updated - New Answer Count: 0');
    print('LOGAPP BLOC: State updated - New CheckBox Answer Count: ${initialCheckBoxAnswer.length}');
    print('LOGAPP BLOC: ========== INITIAL VALUE ANSWER END ==========');
  }

  void _checkBoxAnswer(CheckBoxAnswer event, Emitter<QuestionsState> emit) {
    final List<List<String>> updatedSelectedCheckboxes =
        List.from(state.checkboxQuestion);

    while (updatedSelectedCheckboxes.length <= event.answerIndex) {
      updatedSelectedCheckboxes.add(<String>[]);
    }

    List<String> selectedAnswers = updatedSelectedCheckboxes[event.answerIndex];

    if (event.selected) {
      if (!selectedAnswers.contains(event.answer)) {
        selectedAnswers.add(event.answer);
      }
    } else {
      if (selectedAnswers.contains(event.answer)) {
        selectedAnswers.remove(event.answer);
      }
    }

    updatedSelectedCheckboxes[event.answerIndex] = selectedAnswers;

    developer.log('Updated checkboxes: $updatedSelectedCheckboxes');

    emit(
      state.copyWith(
        checkboxQuestion: updatedSelectedCheckboxes,
      ),
    );
  }

  Future<void> _searchResults(
      SearchResults event, Emitter<QuestionsState> emit) async {
    try {
      print('LOGAPP BLOC: ========== HASIL CARIAN START ==========');
      print('LOGAPP BLOC: Event: HasilCarian');
      print('LOGAPP BLOC: Current State Status: ${state.status}');
      print('LOGAPP BLOC: Answer Count: ${state.answerCount}');
      print('LOGAPP BLOC: Total Questions: ${state.question.data.length}');
      print('LOGAPP BLOC: CheckBox Answer Count: ${state.checkBoxAnswer.length}');
      
      emit(state.copyWith(status: QuestionStatus.loading));
      print('LOGAPP BLOC: State updated to loading');

      // Build query string from form answers
      print('LOGAPP BLOC: Building query string from form answers...');
      print('LOGAPP BLOC: CheckBox Answers: ${state.checkBoxAnswer}');
      print('LOGAPP BLOC: Answers: ${state.answers}');
      
      final queryString = FormAnswerMapper.buildQueryString(state);
      print('LOGAPP BLOC: Query String Length: ${queryString.length}');
      print('LOGAPP BLOC: Query String: $queryString');

      // Convert query string to Map for query parameters
      print('LOGAPP BLOC: Converting query string to query parameters...');
      final queryParams = Uri.splitQueryString(queryString);
      print('LOGAPP BLOC: Query Params Count: ${queryParams.length}');
      print('LOGAPP BLOC: Query Params Keys: ${queryParams.keys.toList()}');
      print('LOGAPP BLOC: Query Params: $queryParams');

      // Call new initiative-review API with GET request
      print('LOGAPP BLOC: Calling getQuestionReview API...');
      final response = await QuestionsRepo().getQuestionReview(
        queryParams: queryParams,
      );

      print('LOGAPP BLOC: API Response Received');
      print('LOGAPP BLOC: Response Type: ${response.runtimeType}');
      print('LOGAPP BLOC: Response: $response');

      // Parse response
      print('LOGAPP BLOC: Parsing API response...');
      final status = response['status'] as String?;
      final message = response['message'] as String?;
      final data = response['data'] as Map<String, dynamic>?;
      final jumlahDitemui = response['jumlah_ditemui'] as int? ?? 0;
      final articles = response['articles'] as List<dynamic>? ?? [];

      print('LOGAPP BLOC: Parsed Response - Status: $status');
      print('LOGAPP BLOC: Parsed Response - Message: $message');
      print('LOGAPP BLOC: Parsed Response - Jumlah Ditemui: $jumlahDitemui');
      print('LOGAPP BLOC: Parsed Response - Articles Count: ${articles.length}');
      print('LOGAPP BLOC: Parsed Response - Data Keys: ${data?.keys.toList() ?? 'null'}');
      print('LOGAPP BLOC: Parsed Response - Data: $data');
      
      if (articles.isNotEmpty) {
        print('LOGAPP BLOC: First Article Sample: ${articles.first}');
      }

      // Distribute articles across clusters based on cluster counts
      final List<InitiativeModel> initiativeModels = [];
      if (data != null && data.isNotEmpty && articles.isNotEmpty) {
        // Create a list of cluster names with their counts
        final List<MapEntry<String, int>> clusterEntries = data.entries
            .map((e) => MapEntry(e.key, (e.value as num).toInt()))
            .toList();
        
        // Calculate total articles expected
        final totalExpected = clusterEntries.fold(0, (sum, entry) => sum + entry.value);
        
        // Distribute articles to clusters
        int articleIndex = 0;
        for (final clusterEntry in clusterEntries) {
          final clusterName = clusterEntry.key;
          final clusterCount = clusterEntry.value;
          
          // Assign articles to this cluster
          for (int i = 0; i < clusterCount && articleIndex < articles.length; i++) {
            final article = articles[articleIndex];
            try {
              // Map article to InitiativeModel format
              final model = InitiativeModel.fromJson({
            'id': article['id']?.toString() ?? '',
            'uuid': article['uuid'] ?? article['id']?.toString() ?? '',
            'nid': article['nid']?.toString() ?? null, // Map nid from API if available
                'cluster': clusterName,
                'name': article['title'] ?? '',
                'description': article['description'] ?? '',
                'objectives': article['body'] ?? null,
                'requirements': null,
                'aids': null,
                'faqs': article['tab_faq'] ?? null,
                'url': null,
                'alternative_url': null,
                'enforce_date': article['publish_date'] ?? null,
                'is_published': article['is_published'] ?? false,
                'updated_at': article['created_at']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
                'agencies': null,
                'target_groups': null,
                'application_steps': null,
                'url_button_name': null,
                'body': article['body'] ?? null,
                'category_slug': article['category_slug']?.toString() ?? null,
                'tab_kumpulan_sasar': article['tab_kumpulan_sasar'] ?? null,
                'tab_syarat_permohonan': article['tab_syarat_permohonan'] ?? null,
                'tab_kadar_bantuan': article['tab_kadar_bantuan'] ?? null,
                'tab_faq': article['tab_faq'] ?? null,
                'tab_agensi_pelaksana': article['tab_agensi_pelaksana'] ?? null,
              });
              
              if (model.id.isNotEmpty) {
                initiativeModels.add(model);
              }
            } catch (e) {
              developer.log('Error mapping article to InitiativeModel: $e');
            }
            articleIndex++;
          }
        }
        
        // If there are remaining articles, assign them to the first cluster
        while (articleIndex < articles.length) {
          final article = articles[articleIndex];
          final clusterName = clusterEntries.isNotEmpty ? clusterEntries.first.key : 'Umum';
          try {
            final model = InitiativeModel.fromJson({
              'id': article['id']?.toString() ?? '',
              'uuid': article['uuid'] ?? article['id']?.toString() ?? '',
              'nid': article['nid']?.toString() ?? null, // Map nid from API if available
              'cluster': clusterName,
              'name': article['title'] ?? '',
              'description': article['description'] ?? '',
              'objectives': article['body'] ?? null,
              'requirements': null,
              'aids': null,
              'faqs': article['tab_faq'] ?? null,
              'url': null,
              'alternative_url': null,
              'enforce_date': article['publish_date'] ?? null,
              'is_published': article['is_published'] ?? false,
              'updated_at': article['created_at']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
              'agencies': null,
              'target_groups': null,
              'application_steps': null,
              'url_button_name': null,
              'body': article['body'] ?? null,
              'category_slug': article['category_slug']?.toString() ?? null,
              'tab_kumpulan_sasar': article['tab_kumpulan_sasar'] ?? null,
              'tab_syarat_permohonan': article['tab_syarat_permohonan'] ?? null,
              'tab_kadar_bantuan': article['tab_kadar_bantuan'] ?? null,
              'tab_faq': article['tab_faq'] ?? null,
              'tab_agensi_pelaksana': article['tab_agensi_pelaksana'] ?? null,
            });
            
            if (model.id.isNotEmpty) {
              initiativeModels.add(model);
            }
          } catch (e) {
            developer.log('Error mapping remaining article to InitiativeModel: $e');
          }
          articleIndex++;
        }
      } else if (articles.isNotEmpty) {
        // Fallback: assign all articles to 'Umum' if no cluster data
        initiativeModels.addAll(articles.map((article) {
          try {
            return InitiativeModel.fromJson({
              'id': article['id']?.toString() ?? '',
              'uuid': article['uuid'] ?? article['id']?.toString() ?? '',
              'nid': article['nid']?.toString() ?? null, // Map nid from API if available
              'cluster': 'Umum',
              'name': article['title'] ?? '',
              'description': article['description'] ?? '',
              'objectives': article['body'] ?? null,
              'requirements': null,
              'aids': null,
              'faqs': article['tab_faq'] ?? null,
              'url': null,
              'alternative_url': null,
              'enforce_date': article['publish_date'] ?? null,
              'is_published': article['is_published'] ?? false,
              'updated_at': article['created_at']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
              'agencies': null,
              'target_groups': null,
              'application_steps': null,
              'url_button_name': null,
              'body': article['body'] ?? null,
              'category_slug': article['category_slug']?.toString() ?? null,
              'tab_kumpulan_sasar': article['tab_kumpulan_sasar'] ?? null,
              'tab_syarat_permohonan': article['tab_syarat_permohonan'] ?? null,
              'tab_kadar_bantuan': article['tab_kadar_bantuan'] ?? null,
              'tab_faq': article['tab_faq'] ?? null,
              'tab_agensi_pelaksana': article['tab_agensi_pelaksana'] ?? null,
            });
          } catch (e) {
            developer.log('Error mapping article to InitiativeModel: $e');
            return InitiativeModel.initial();
          }
        }).where((model) => model.id.isNotEmpty));
      }

      print('LOGAPP BLOC: Mapped ${initiativeModels.length} articles to InitiativeModel');
      if (initiativeModels.isNotEmpty) {
        print('LOGAPP BLOC: First InitiativeModel - ID: ${initiativeModels.first.id}, Name: ${initiativeModels.first.name}, Cluster: ${initiativeModels.first.cluster}');
      }

      // Prepare pie chart data from response data object
      print('LOGAPP BLOC: Preparing pie chart data...');
      final Map<String, dynamic> pieChartData = {
        'data': data ?? {},
        'jumlah_ditemui': jumlahDitemui,
      };
      print('LOGAPP BLOC: Pie Chart Data: $pieChartData');

      // Store results in state
      print('LOGAPP BLOC: Updating state with results...');
      emit(
        state.copyWith(
          status: QuestionStatus.searchResults,
          searchResults: initiativeModels,
          pieChartData: pieChartData,
        ),
      );
      print('LOGAPP BLOC: State updated successfully');
      print('LOGAPP BLOC: ========== HASIL CARIAN SUCCESS ==========');
    } on StateException catch (e) {
      print('LOGAPP BLOC: ========== HASIL CARIAN STATE EXCEPTION ==========');
      print('LOGAPP BLOC: StateException: $e');
      print('LOGAPP BLOC: Stack Trace: ${StackTrace.current}');
      developer.log('LOGAPP BLOC: Error sending data: $e', name: 'result-error');
      emit(state.copyWith(
        status: QuestionStatus.error,
        errorMessage: 'Error: $e',
      ));
      print('LOGAPP BLOC: State updated to error status');
    } on DioException catch (e) {
      print('LOGAPP BLOC: ========== HASIL CARIAN DIO EXCEPTION ==========');
      print('LOGAPP BLOC: DioException Type: ${e.type}');
      print('LOGAPP BLOC: DioException Message: ${e.message}');
      print('LOGAPP BLOC: DioException Response: ${e.response?.data}');
      print('LOGAPP BLOC: DioException Status Code: ${e.response?.statusCode}');
      print('LOGAPP BLOC: DioException Request Path: ${e.requestOptions.path}');
      print('LOGAPP BLOC: DioException Request Data: ${e.requestOptions.data}');
      print('LOGAPP BLOC: DioException Stack Trace: ${e.stackTrace}');
      developer.log('LOGAPP BLOC: DioException sending data: $e\n${e.stackTrace}', name: 'result-error');
      emit(state.copyWith(
        status: QuestionStatus.error,
        errorMessage: 'Error: ${e.message ?? e.toString()}',
      ));
      print('LOGAPP BLOC: State updated to error status');
    } catch (e, st) {
      print('LOGAPP BLOC: ========== HASIL CARIAN GENERAL EXCEPTION ==========');
      print('LOGAPP BLOC: Exception Type: ${e.runtimeType}');
      print('LOGAPP BLOC: Exception Message: $e');
      print('LOGAPP BLOC: Stack Trace: $st');
      developer.log('LOGAPP BLOC: Error sending data: $e\n$st', name: 'result-error');
      emit(state.copyWith(
        status: QuestionStatus.error,
        errorMessage: 'Error: $e',
      ));
      print('LOGAPP BLOC: State updated to error status');
    }
  }

  Future<void> _getArticlesByKategori(
      GetArticlesByKategori event, Emitter<QuestionsState> emit) async {
    try {
      print('LOGAPP BLOC: ========== GET ARTICLES BY KATEGORI START ==========');
      print('LOGAPP BLOC: Event: GetArticlesByKategori');
      print('LOGAPP BLOC: Kategori: ${event.kategori}');
      print('LOGAPP BLOC: Current State Status: ${state.status}');
      
      emit(state.copyWith(status: QuestionStatus.loading));
      print('LOGAPP BLOC: State updated to loading');

      // Build query string from form answers
      print('LOGAPP BLOC: Building query string from form answers...');
      final queryString = FormAnswerMapper.buildQueryString(state);
      print('LOGAPP BLOC: Query String: $queryString');

      // Convert query string to Map for query parameters
      final queryParams = Uri.splitQueryString(queryString);
      print('LOGAPP BLOC: Query Params Count: ${queryParams.length}');
      print('LOGAPP BLOC: Query Params: $queryParams');

      // Call getQuestionDetails API with kategori parameter
      print('LOGAPP BLOC: Calling getQuestionDetails API with kategori: ${event.kategori}...');
      final response = await QuestionsRepo().getQuestionDetails(
        queryParams: queryParams,
        kategori: event.kategori,
      );

      print('LOGAPP BLOC: API Response Received');
      print('LOGAPP BLOC: Response Type: ${response.runtimeType}');
      print('LOGAPP BLOC: Response: $response');

      // Parse response
      print('LOGAPP BLOC: Parsing API response...');
      final status = response['status'] as String?;
      final message = response['message'] as String?;
      final articles = response['articles'] as List<dynamic>? ?? [];

      print('LOGAPP BLOC: Parsed Response - Status: $status');
      print('LOGAPP BLOC: Parsed Response - Message: $message');
      print('LOGAPP BLOC: Parsed Response - Articles Count: ${articles.length}');

      // Map articles to InitiativeModel
      final List<InitiativeModel> initiativeModels = articles.map((article) {
        try {
          // Map article to InitiativeModel format
          return InitiativeModel.fromJson({
            'id': article['id']?.toString() ?? '',
            'uuid': article['uuid'] ?? article['id']?.toString() ?? '',
            'nid': article['nid']?.toString() ?? null, // Map nid from API if available
            'cluster': event.kategori, // Use kategori from event
            'name': article['title'] ?? '',
            'description': article['summary'] ?? article['body'] ?? '',
            'objectives': article['body'] ?? null,
            'requirements': null,
            'aids': null,
            'faqs': null,
            'url': article['url'] ?? null,
            'alternative_url': null,
            'enforce_date': null,
            'is_published': true,
            'updated_at': DateTime.now().millisecondsSinceEpoch.toString(),
            'agencies': null,
            'target_groups': null,
            'application_steps': null,
            'url_button_name': null,
            'body': article['body'] ?? null,
            'category_slug': article['kategori']?.isNotEmpty == true 
                ? article['kategori'][0]?.toString() 
                : null,
            'tab_kumpulan_sasar': null,
            'tab_syarat_permohonan': null,
            'tab_kadar_bantuan': null,
            'tab_faq': null,
            'tab_agensi_pelaksana': null,
          });
        } catch (e) {
          developer.log('Error mapping article to InitiativeModel: $e');
          return InitiativeModel.initial();
        }
      }).where((model) => model.id.isNotEmpty).toList();

      print('LOGAPP BLOC: Mapped ${initiativeModels.length} articles to InitiativeModel');
      if (initiativeModels.isNotEmpty) {
        print('LOGAPP BLOC: First InitiativeModel - ID: ${initiativeModels.first.id}, Name: ${initiativeModels.first.name}, Cluster: ${initiativeModels.first.cluster}');
      }

      // Update searchResults with articles from API
      print('LOGAPP BLOC: Updating state with articles...');
      emit(
        state.copyWith(
          status: QuestionStatus.searchResults,
          searchResults: initiativeModels,
        ),
      );
      print('LOGAPP BLOC: State updated successfully');
      print('LOGAPP BLOC: ========== GET ARTICLES BY KATEGORI SUCCESS ==========');
    } on StateException catch (e) {
      print('LOGAPP BLOC: ========== GET ARTICLES BY KATEGORI STATE EXCEPTION ==========');
      print('LOGAPP BLOC: StateException: $e');
      developer.log('LOGAPP BLOC: Error getting articles by kategori: $e', name: 'result-error');
      emit(state.copyWith(
        status: QuestionStatus.error,
        errorMessage: 'Error: $e',
      ));
    } on DioException catch (e) {
      print('LOGAPP BLOC: ========== GET ARTICLES BY KATEGORI DIO EXCEPTION ==========');
      print('LOGAPP BLOC: DioException Type: ${e.type}');
      print('LOGAPP BLOC: DioException Message: ${e.message}');
      print('LOGAPP BLOC: DioException Response: ${e.response?.data}');
      developer.log('LOGAPP BLOC: DioException getting articles by kategori: $e\n${e.stackTrace}', name: 'result-error');
      emit(state.copyWith(
        status: QuestionStatus.error,
        errorMessage: 'Error: ${e.message ?? e.toString()}',
      ));
    } catch (e, st) {
      print('LOGAPP BLOC: ========== GET ARTICLES BY KATEGORI GENERAL EXCEPTION ==========');
      print('LOGAPP BLOC: Exception Type: ${e.runtimeType}');
      print('LOGAPP BLOC: Exception Message: $e');
      print('LOGAPP BLOC: Stack Trace: $st');
      developer.log('LOGAPP BLOC: Error getting articles by kategori: $e\n$st', name: 'result-error');
      emit(state.copyWith(
        status: QuestionStatus.error,
        errorMessage: 'Error: $e',
      ));
    }
  }

  void _resetStatus(ResetStatus event, Emitter<QuestionsState> emit) => emit(state.copyWith(
        status: QuestionStatus.initial,
      ));

  @override
  QuestionsState? fromJson(Map<String, dynamic> json) {
    developer.log('question_state: $json');
    try {
      return QuestionsState.fromJson(json);
    } on DataMapException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(QuestionsState state) {
    return state.saveToJson();
  }
}
