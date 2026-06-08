part of 'index.dart';

// Helper class to return both questions and value-label mapping
class FormQuestionsResult {
  final Pagination<QuestionModel> questions;
  final Map<String, Map<String, String>> valueLabelMapping; // criteriaRefId -> (value -> label)
  
  FormQuestionsResult({
    required this.questions,
    required this.valueLabelMapping,
  });
}

class QuestionsRepo {
  static const String _formQuestionsPath = '/initiative/question';

  Future<Map<String, dynamic>> getQuestionReview(
      {required Map<String, String> queryParams}) async {
    try {
      print('LOGAPP REPO: ========== GET QUESTION REVIEW START ==========');
      print('LOGAPP REPO: Visitor ID: ${Visitor.visitorId}');
      print('LOGAPP REPO: Query Params Count: ${queryParams.length}');
      print('LOGAPP REPO: Query Params Keys: ${queryParams.keys.toList()}');
      print('LOGAPP REPO: Query Params Values: ${queryParams.values.toList()}');
      print('LOGAPP REPO: Full Query Params: $queryParams');
      
      Dio dio = await HttpsConfig().getDio(
        visitorId: Visitor.visitorId,
        queries: queryParams,
      );
      
      final endpoint = '/initiative';
      final fullUrl = HttpsConfig.getFullUrl(endpoint, queryParams: queryParams);
      print('LOGAPP REPO: API CALL: GET $fullUrl');
      print('LOGAPP REPO: Request Headers: ${dio.options.headers}');
      
      final startTime = DateTime.now();
      print('LOGAPP REPO: Request Start Time: $startTime');
      
      Response response = await dio.get(
        endpoint,
        queryParameters: queryParams,
      );

      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);
      print('LOGAPP REPO: Request End Time: $endTime');
      print('LOGAPP REPO: Request Duration: ${duration.inMilliseconds}ms');
      print('LOGAPP REPO: Response Status Code: ${response.statusCode}');
      print('LOGAPP REPO: Response Headers: ${response.headers}');
      print('LOGAPP REPO: Response Data Type: ${response.data.runtimeType}');
      print('LOGAPP REPO: Response Data: ${response.data}');
      
      if (response.data is Map) {
        final responseMap = response.data as Map<String, dynamic>;
        print('LOGAPP REPO: Response Status: ${responseMap['status']}');
        print('LOGAPP REPO: Response Message: ${responseMap['message']}');
        print('LOGAPP REPO: Response Data Keys: ${responseMap.keys.toList()}');
        if (responseMap.containsKey('data')) {
          print('LOGAPP REPO: Response Data Content: ${responseMap['data']}');
        }
        if (responseMap.containsKey('articles')) {
          final articles = responseMap['articles'];
          print('LOGAPP REPO: Articles Count: ${articles is List ? articles.length : 'N/A'}');
        }
        if (responseMap.containsKey('jumlah_ditemui')) {
          print('LOGAPP REPO: Jumlah Ditemui: ${responseMap['jumlah_ditemui']}');
        }
      }
      
      print('LOGAPP REPO: ========== GET QUESTION REVIEW SUCCESS ==========');
      return response.data;
    } on DioException catch (e) {
      print('LOGAPP REPO: ========== GET QUESTION REVIEW DIO EXCEPTION ==========');
      print('LOGAPP REPO: Error Type: ${e.type}');
      print('LOGAPP REPO: Error Message: ${e.message}');
      print('LOGAPP REPO: Error Response: ${e.response?.data}');
      print('LOGAPP REPO: Error Status Code: ${e.response?.statusCode}');
      print('LOGAPP REPO: Error Request Path: ${e.requestOptions.path}');
      print('LOGAPP REPO: Error Request Query Params: ${e.requestOptions.queryParameters}');
      print('LOGAPP REPO: Error Request Headers: ${e.requestOptions.headers}');
      print('LOGAPP REPO: Error Stack Trace: ${e.stackTrace}');
      log('LOGAPP REPO: DioException getting question review: ${e.toString()}');
      throw HttpException(message: e.message ?? e.toString(), data: e.stackTrace);
    } on HttpException catch (e) {
      print('LOGAPP REPO: ========== GET QUESTION REVIEW HTTP EXCEPTION ==========');
      print('LOGAPP REPO: HttpException: ${e.toString()}');
      log('LOGAPP REPO: HttpException getting question review: ${e.toString()}');
      rethrow;
    } catch (e, st) {
      print('LOGAPP REPO: ========== GET QUESTION REVIEW GENERAL EXCEPTION ==========');
      print('LOGAPP REPO: Exception Type: ${e.runtimeType}');
      print('LOGAPP REPO: Exception Message: $e');
      print('LOGAPP REPO: Stack Trace: $st');
      log('LOGAPP REPO: Error getting question review: $e\n$st');
      throw HttpException(message: e.toString(), data: st);
    }
  }

  Future<Map<String, dynamic>> getQuestionDetails(
      {required Map<String, String> queryParams, required String kategori}) async {
    try {
      print('LOGAPP REPO: ========== GET QUESTION DETAILS START ==========');
      print('LOGAPP REPO: Visitor ID: ${Visitor.visitorId}');
      print('LOGAPP REPO: Kategori: $kategori');
      print('LOGAPP REPO: Query Params Count: ${queryParams.length}');
      print('LOGAPP REPO: Query Params Keys: ${queryParams.keys.toList()}');
      print('LOGAPP REPO: Query Params Values: ${queryParams.values.toList()}');
      print('LOGAPP REPO: Full Query Params: $queryParams');
      
      // Add kategori parameter to query params
      final paramsWithKategori = Map<String, String>.from(queryParams);
      paramsWithKategori['kategori'] = kategori;
      
      Dio dio = await HttpsConfig().getDio(
        visitorId: Visitor.visitorId,
        queries: paramsWithKategori,
      );
      
      final endpoint = '/initiative/details';
      final fullUrl = HttpsConfig.getFullUrl(endpoint, queryParams: paramsWithKategori);
      print('LOGAPP REPO: API CALL: GET $fullUrl');
      print('LOGAPP REPO: Request Headers: ${dio.options.headers}');
      
      final startTime = DateTime.now();
      print('LOGAPP REPO: Request Start Time: $startTime');
      
      Response response = await dio.get(
        endpoint,
        queryParameters: paramsWithKategori,
      );

      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);
      print('LOGAPP REPO: Request End Time: $endTime');
      print('LOGAPP REPO: Request Duration: ${duration.inMilliseconds}ms');
      print('LOGAPP REPO: Response Status Code: ${response.statusCode}');
      print('LOGAPP REPO: Response Headers: ${response.headers}');
      print('LOGAPP REPO: Response Data Type: ${response.data.runtimeType}');
      print('LOGAPP REPO: Response Data: ${response.data}');
      
      if (response.data is Map) {
        final responseMap = response.data as Map<String, dynamic>;
        print('LOGAPP REPO: Response Status: ${responseMap['status']}');
        print('LOGAPP REPO: Response Message: ${responseMap['message']}');
        print('LOGAPP REPO: Response Data Keys: ${responseMap.keys.toList()}');
        if (responseMap.containsKey('data')) {
          print('LOGAPP REPO: Response Data Content: ${responseMap['data']}');
        }
        if (responseMap.containsKey('articles')) {
          final articles = responseMap['articles'];
          print('LOGAPP REPO: Articles Count: ${articles is List ? articles.length : 'N/A'}');
        }
        if (responseMap.containsKey('jumlah_ditemui')) {
          print('LOGAPP REPO: Jumlah Ditemui: ${responseMap['jumlah_ditemui']}');
        }
        if (responseMap.containsKey('kategori_dipilih')) {
          print('LOGAPP REPO: Kategori Dipilih: ${responseMap['kategori_dipilih']}');
        }
      }
      
      print('LOGAPP REPO: ========== GET QUESTION DETAILS SUCCESS ==========');
      return response.data;
    } on DioException catch (e) {
      print('LOGAPP REPO: ========== GET QUESTION DETAILS DIO EXCEPTION ==========');
      print('LOGAPP REPO: Error Type: ${e.type}');
      print('LOGAPP REPO: Error Message: ${e.message}');
      print('LOGAPP REPO: Error Response: ${e.response?.data}');
      print('LOGAPP REPO: Error Status Code: ${e.response?.statusCode}');
      print('LOGAPP REPO: Error Request Path: ${e.requestOptions.path}');
      print('LOGAPP REPO: Error Request Query Params: ${e.requestOptions.queryParameters}');
      print('LOGAPP REPO: Error Request Headers: ${e.requestOptions.headers}');
      print('LOGAPP REPO: Error Stack Trace: ${e.stackTrace}');
      log('LOGAPP REPO: DioException getting question details: ${e.toString()}');
      throw HttpException(message: e.message ?? e.toString(), data: e.stackTrace);
    } on HttpException catch (e) {
      print('LOGAPP REPO: ========== GET QUESTION DETAILS HTTP EXCEPTION ==========');
      print('LOGAPP REPO: HttpException: ${e.toString()}');
      log('LOGAPP REPO: HttpException getting question details: ${e.toString()}');
      rethrow;
    } catch (e, st) {
      print('LOGAPP REPO: ========== GET QUESTION DETAILS GENERAL EXCEPTION ==========');
      print('LOGAPP REPO: Exception Type: ${e.runtimeType}');
      print('LOGAPP REPO: Exception Message: $e');
      print('LOGAPP REPO: Stack Trace: $st');
      log('LOGAPP REPO: Error getting question details: $e\n$st');
      throw HttpException(message: e.toString(), data: st);
    }
  }

  Future<FormQuestionsResult> getFormQuestions() async {
    try {
      print('LOGAPP REPO: ========== GET FORM QUESTIONS START ==========');
      print('LOGAPP REPO: Visitor ID: ${Visitor.visitorId}');
      
      Dio dio = await HttpsConfig().getDio(
        visitorId: Visitor.visitorId,
        queries: {},
      );

      final fullUrl = HttpsConfig.getFullUrl(_formQuestionsPath);
      print('LOGAPP REPO: API CALL: GET $fullUrl');
      
      Response response = await dio.get(_formQuestionsPath);
      
      print('LOGAPP REPO: Response Status Code: ${response.statusCode}');
      print('LOGAPP REPO: Response Data Type: ${response.data.runtimeType}');
      
      if (response.data is Map && response.data.containsKey('data')) {
        final dataMap = response.data['data'];
        print('LOGAPP REPO: Data Keys: ${dataMap.keys.toList()}');
        
        if (dataMap.containsKey('data') && dataMap['data'] is List) {
          final questionsList = dataMap['data'] as List;
          print('LOGAPP REPO: Questions Count: ${questionsList.length}');
          
          // Map API response to QuestionModel with sequence info
          List<Map<String, dynamic>> questionsWithSequence = questionsList.map((item) {
            final apiQuestion = item as Map<String, dynamic>;
            return {
              'question': apiQuestion,
              'sequence': apiQuestion['sequence'] ?? 0,
            };
          }).toList();
          
          // Sort by sequence
          questionsWithSequence.sort((a, b) {
            final aSeq = a['sequence'] as int;
            final bSeq = b['sequence'] as int;
            return aSeq.compareTo(bSeq);
          });
          
          // Map to QuestionModel and create value-label mapping
          final Map<String, Map<String, String>> valueLabelMapping = {};
          List<QuestionModel> questions = questionsWithSequence.map((item) {
            final apiQuestion = item['question'] as Map<String, dynamic>;
            
            // Map type: "select" -> "dropdown" or "dropdown-year", "radio" -> "radio-button"
            String answerType = apiQuestion['type'] ?? '';
            final name = apiQuestion['name'] ?? '';
            
            if (answerType == 'select') {
              // Check if it's tahun_kelahiran for dropdown-year
              if (name == 'tahun_kelahiran') {
                answerType = 'dropdown-year';
              } else {
                answerType = 'dropdown';
              }
            } else if (answerType == 'radio') {
              answerType = 'radio-button';
            }
            
            // Extract answers from options - ALWAYS use VALUE from API (not label)
            // Store value in answers for form submission
            // Also create value->label mapping for display
            List<String>? answers;
            final Map<String, String> questionMapping = {};
            if (apiQuestion.containsKey('options') && apiQuestion['options'] is List) {
              final options = apiQuestion['options'] as List;
              answers = options.map((opt) {
                if (opt is Map && opt.containsKey('value') && opt['value'] != null) {
                  final value = opt['value'].toString();
                  final label = opt.containsKey('label') ? opt['label'].toString() : value;
                  // Skip empty value or "- None -"
                  if (value.isNotEmpty && value != '' && value != '- None -') {
                    // Store value->label mapping
                    questionMapping[value] = label;
                    return value;
                  }
                }
                return '';
              }).where((item) => item.isNotEmpty).toList();
            }
            
            // Store mapping for this question
            if (questionMapping.isNotEmpty) {
              valueLabelMapping[name] = questionMapping;
            }
            
            return QuestionModel(
              id: apiQuestion['id'] ?? '',
              criteriaRefId: name,
              question: apiQuestion['label'] ?? '',
              answerType: answerType,
              answers: answers,
            );
          }).toList();
          
          // Create pagination object
          final total = dataMap['total'] ?? questions.length;
          final Pagination<QuestionModel> questionData = Pagination<QuestionModel>(
            path: _formQuestionsPath,
            firstPageUrl: '',
            lastPageUrl: '',
            currentPage: 1,
            from: 1,
            to: questions.length,
            lastPage: 1,
            perPage: questions.length,
            total: total,
            data: questions,
          );
          
          print('LOGAPP REPO: Mapped Questions Count: ${questions.length}');
          print('LOGAPP REPO: Value-Label Mapping Count: ${valueLabelMapping.length}');
          print('LOGAPP REPO: ========== GET FORM QUESTIONS SUCCESS ==========');
          
          return FormQuestionsResult(
            questions: questionData,
            valueLabelMapping: valueLabelMapping,
          );
        }
      }
      
      throw HttpException(message: 'Invalid API response format', data: null);
    } on DioException catch (e) {
      print('LOGAPP REPO: ========== GET FORM QUESTIONS DIO EXCEPTION ==========');
      print('LOGAPP REPO: Error Type: ${e.type}');
      print('LOGAPP REPO: Error Message: ${e.message}');
      print('LOGAPP REPO: Error Response: ${e.response?.data}');
      print('LOGAPP REPO: Error Status Code: ${e.response?.statusCode}');
      log('LOGAPP REPO: DioException getting form questions: ${e.toString()}');
      throw HttpException(message: e.message ?? e.toString(), data: e.stackTrace);
    } on HttpException catch (e) {
      print('LOGAPP REPO: ========== GET FORM QUESTIONS HTTP EXCEPTION ==========');
      print('LOGAPP REPO: HttpException: ${e.toString()}');
      log('LOGAPP REPO: HttpException getting form questions: ${e.toString()}');
      rethrow;
    } catch (e, st) {
      print('LOGAPP REPO: ========== GET FORM QUESTIONS GENERAL EXCEPTION ==========');
      print('LOGAPP REPO: Exception Type: ${e.runtimeType}');
      print('LOGAPP REPO: Exception Message: $e');
      print('LOGAPP REPO: Stack Trace: $st');
      log('LOGAPP REPO: Error getting form questions: $e\n$st');
      throw HttpException(message: e.toString(), data: st);
    }
  }
}
