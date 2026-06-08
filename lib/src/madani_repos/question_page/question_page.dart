import 'dart:developer';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madani/src/index.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MadaniQuestionPage extends StatefulWidget {
  const MadaniQuestionPage({super.key});

  @override
  State<MadaniQuestionPage> createState() => _MadaniQuestionPageState();
}

class _MadaniQuestionPageState extends State<MadaniQuestionPage> {
  bool _hasNavigatedToResultPage = false; // Flag to track if we've navigated to result page
  final _formKey = GlobalKey<FormState>();
  
  // Testing flag: Set to false to skip required validation
  static const bool _requireAllAnswers = false; // Change to true for production
  // DEV ONLY: tukar ke true bila nak guna auto isi semua soalan
  static const bool _enableDevAutoAnswerButton = false;

  bool _isFabExtended = true;
  Timer? _scrollStopTimer;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionsBloc, QuestionsState>(
      listener: (context, state) {
        print('LOGAPP PAGE: BlocListener - Status Changed: ${state.status}');
        if (state.status == QuestionStatus.searchResults) {
          print('LOGAPP PAGE: Status is searchResults - Checking if result page exists');
          print('LOGAPP PAGE: Search Results Count: ${state.searchResults.length}');
          
          // Only navigate if we haven't navigated to result page yet (initial search)
          // When kategori button is clicked, result page already exists, so we skip navigation
          if (!_hasNavigatedToResultPage) {
            print('LOGAPP PAGE: First time search - Navigating to result page');
            _hasNavigatedToResultPage = true;
            // Close loading dialog and navigate to result page
            Navigator.of(context, rootNavigator: true).pop();
            // Push result page within QuestionPageStartPage navigator to access QuestionsBloc
            // fullscreenDialog is already set in questionpage_route.dart
            // Reset flag when result page is popped (user goes back)
            // Store navigator context before push to avoid context issues
            final navigator = Navigator.of(context);
            navigator.pushNamed(QuestionPageRoutes.resultPage).then((result) {
              // Only reset flag if widget is still mounted and result is true
              // Use addPostFrameCallback to ensure context is still valid and avoid navigation issues
              if (!mounted) return;
              if (result == true) {
                print('LOGAPP PAGE: Result page popped - Resetting navigation flag');
                // Use addPostFrameCallback to delay setState and avoid navigation conflicts
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!mounted) return;
                  try {
                    setState(() {
                      _hasNavigatedToResultPage = false;
                    });
                  } catch (e) {
                    print('LOGAPP PAGE: Error resetting flag: $e');
                  }
                });
              }
            });
            print('LOGAPP PAGE: Navigation to result page completed');
          } else {
            print('LOGAPP PAGE: Result page already exists - Skipping navigation (kategori button clicked)');
            // Don't pop anything - result page is already open and will handle the update
            // The loading dialog should not be shown when kategori button is clicked
            // because result page is already displayed
          }
        } else if (state.status == QuestionStatus.error) {
          print('LOGAPP PAGE: Status is error - Showing error message');
          print('LOGAPP PAGE: Error Message: ${state.errorMessage}');
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  'Please Try Again later...',
                  style: TextStyleMadani.textStyle.interText
                      .copyWith(color: MadaniColor.white),
                ),
              ),
            );
          print('LOGAPP PAGE: Error snackbar shown');
        }
      },
      builder: (context, state) {
        // Only show loading if questions are empty AND status is loading/initial
        // If questions are already loaded, don't show loading even if status is initial
        final isLoading = state.question.data.isEmpty && 
                         (state.status == QuestionStatus.loading || 
                          state.status == QuestionStatus.initial);
        
        return Scaffold(
          backgroundColor: MadaniColor.white,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton:
              isLoading ? null : _buildFloatingActionButton(context, state),
          body: isLoading
              ? _buildLoadingIndicator(context)
              : NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    try {
                      if (notification.metrics.axis == Axis.vertical) {
                        if (notification.direction == ScrollDirection.idle) {
                          _handleScrollStopped();
                        } else {
                          _handleScrollStarted();
                        }
                      }
                    } catch (e) {
                      log('Error handling scroll notification: $e');
                    }
                    return false;
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                      pinned: true,
                      backgroundColor: context
                              .watch<AccessibilityCubit>()
                              .state
                              .resetColor
                          ? getThemeDarkColor(0)
                          : getThemeDarkColor(context
                              .watch<AccessibilityCubit>()
                              .state
                              .indexColor), // Dark theme color
                      leading: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: MadaniColor.white,
                        ),
                        onPressed: () {
                          // Use rootNavigator to pop since question page is pushed with rootNavigator
                          if (Navigator.of(context, rootNavigator: true).canPop()) {
                            Navigator.of(context, rootNavigator: true).pop();
                          }
                        },
                      ),
                      centerTitle: true,
                      title: Text(
                        'Semak Bantuan',
                        style: TextStyleMadani.textStyle.interAppbar.copyWith(
                          color: MadaniColor.white,
                        ),
                      ),
                    ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: SearchStick(
                          minHeight: 100,
                          maxHeight: 100,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: MadaniColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: MadaniColor.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: const ProgressIndicatorWidget(),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          color: MadaniColor.white,
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20.h),
                          child: Form(
                            key: _formKey,
                            child: BlocListener<QuestionsBloc, QuestionsState>(
                              listener: (context, statusCheck) {
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildQuestionsList(state),
                                  SizedBox(height: 24.h),
                                if (_enableDevAutoAnswerButton) ...[
                                  TextButton(
                                    onPressed: () {
                                      _devAutoSelectAllQuestions(context, state);
                                    },
                                    child: Text(
                                      'Auto pilih semua (DEV)',
                                      style: TextStyleMadani.textStyle.interText.copyWith(
                                        fontSize: 14.sp,
                                        color: MadaniColor.grey3,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                ],
                                  // Submit button kini dipindahkan ke FAB di bawah kanan.
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollStopTimer?.cancel();
    super.dispose();
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: context
                  .watch<AccessibilityCubit>()
                  .state
                  .resetColor
              ? getThemeDarkColor(0)
              : getThemeDarkColor(context
                  .watch<AccessibilityCubit>()
                  .state
                  .indexColor),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: MadaniColor.white,
            ),
            onPressed: () {
              if (Navigator.of(context, rootNavigator: true).canPop()) {
                Navigator.of(context, rootNavigator: true).pop();
              }
            },
          ),
          centerTitle: true,
          title: Text(
            'Semak Bantuan',
            style: TextStyleMadani.textStyle.interAppbar.copyWith(
              color: MadaniColor.white,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context
                            .watch<AccessibilityCubit>()
                            .state
                            .resetColor
                        ? getThemePrimaryColor(0)
                        : getThemePrimaryColor(context
                            .watch<AccessibilityCubit>()
                            .state
                            .indexColor),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Memuatkan...',
                  style: TextStyleMadani.textStyle.interMedium.copyWith(
                    fontSize: 16.sp,
                    color: MadaniColor.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionsList(QuestionsState state) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, i) {
        final question = state.question.data[i];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: MadaniColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DynamicQuestion(
            id: question.criteriaRefId,
            questions: question.question,
            answerType: question.answerType,
            answers: question.answers ?? [],
            answerIndex: i,
          ),
        );
      },
      separatorBuilder: (context, i) => SizedBox(height: 16.h),
      itemCount: state.question.data.length,
    );
  }

  bool _isSurveyComplete(QuestionsState state) {
    try {
      if (state.question.data.isEmpty) return false;
      return state.answerCount >= state.question.data.length;
    } catch (e) {
      log('Error checking survey completion: $e');
      return false;
    }
  }

  // DEV ONLY: auto pilih satu jawapan untuk semua soalan (untuk testing)
  void _devAutoSelectAllQuestions(BuildContext context, QuestionsState state) {
    try {
      print('LOGAPP PAGE DEV: Auto select all questions (DEV button pressed)');
      final bloc = context.read<QuestionsBloc>();

      for (var i = 0; i < state.question.data.length; i++) {
        final question = state.question.data[i];
        final answers = question.answers ?? [];
        if (answers.isEmpty) {
          continue;
        }

        final firstValue = answers.first;
        final id = question.criteriaRefId;

        switch (question.answerType) {
          case 'radio-button':
          case 'dropdown':
          case 'dropdown-year':
            bloc.add(
              StoreAnswer(
                answer: AnswerModel(id: id, answer: [firstValue]),
                id: id,
                questionAnswer: firstValue,
                answerIndex: i,
              ),
            );
            break;
          case 'checkbox':
            bloc.add(
              CheckBoxAnswer(
                answer: firstValue,
                answerIndex: i,
                selected: true,
              ),
            );
            bloc.add(
              StoreAnswer(
                answer: AnswerModel(id: id, answer: [firstValue]),
                id: id,
                questionAnswer: firstValue,
                answerIndex: i,
              ),
            );
            break;
          default:
            // Untuk jenis lain yang tak dikenali, skip sahaja
            break;
        }
      }

      print('LOGAPP PAGE DEV: Auto select all questions completed');
    } catch (e, stack) {
      print('LOGAPP PAGE DEV: Error auto select all questions: $e\n$stack');
    }
  }

  void _handleScrollStarted() {
    try {
      _scrollStopTimer?.cancel();
      if (!_isFabExtended) {
        // Already collapsed.
        return;
      }
      setState(() {
        _isFabExtended = false;
      });
    } catch (e) {
      log('Error in _handleScrollStarted: $e');
    }
  }

  void _handleScrollStopped() {
    try {
      _scrollStopTimer?.cancel();
      _scrollStopTimer = Timer(const Duration(milliseconds: 300), () {
        if (!mounted) return;
        setState(() {
          _isFabExtended = true;
        });
      });
    } catch (e) {
      log('Error in _handleScrollStopped: $e');
    }
  }

  Widget _buildFloatingActionButton(
      BuildContext context, QuestionsState state) {
    final bool isComplete = _isSurveyComplete(state);

    // Warna asal butang (gradient pink) – guna warna utama gradient.
    const Color activeFabColor = Color(0xFFEC1C7C);
    // Versi desaturated untuk state disable.
    const Color disabledFabColor = Color(0xFFE8B4CF);

    // Default: disabled, extended dengan text.
    // Ikon kekal guna assets/images/search.svg untuk semua state.
    const String iconPath = 'assets/images/search.svg';
    Color backgroundColor = disabledFabColor;
    bool showLabel = true;

    // Bila user scroll, tukar ke icon-only FAB (tanpa text).
    if (!_isFabExtended) {
      showLabel = false;
    }

    // Bila survey lengkap, warna butang jadi warna aktif, dan ikut extended/collapsed.
    if (isComplete) {
      backgroundColor = activeFabColor;
      showLabel = _isFabExtended;
    }

    final VoidCallback? onPressed =
        isComplete ? () => _showDisclaimerDialog(context, state) : null;

    final Widget icon = SvgPicture.asset(
      iconPath,
      width: 24.w,
      height: 24.w,
    );

    if (showLabel) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        icon: icon,
        label: Text(
          'Hasil Carian',
          style: TextStyleMadani.textStyle.interMedium.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: MadaniColor.white,
          ),
        ),
      );
    }

    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      child: icon,
    );
  }

  Widget _buildSubmitButton(BuildContext context, QuestionsState state) {
    return BlocBuilder<QuestionsBloc, QuestionsState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 56.h,
          child: GestureDetector(
            onTap: () {
              _showDisclaimerDialog(context, state);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFEC1C7C), // Pink
                    Color(0xFFD91A93), // Darker pink
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  'Hasil Carian',
                  style: TextStyleMadani.textStyle.interMedium.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: MadaniColor.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDisclaimerDialog(BuildContext context, QuestionsState state) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: MadaniColor.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Penafian',
                  style: TextStyleMadani.textStyle.interText.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Kelayakan inisiatif yang dipaparkan adalah bersifat umum dan tertakluk kepada kriteria spesifik/tambahan yang ditetapkan oleh agensi pelaksana.',
                  textAlign: TextAlign.center,
                  style: TextStyleMadani.textStyle.interText.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  width: double.infinity,
                  height: 45.h,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFEC1C7C),
                          Color(0xFFD91A93),
                        ],
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        _handleButtonPress(context, state);
                      },
                      child: Text(
                        'OK',
                        style: TextStyleMadani.textStyle.interText.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleButtonPress(BuildContext context, QuestionsState state) {
    print('LOGAPP PAGE: ========== HANDLE BUTTON PRESS START ==========');
    print('LOGAPP PAGE: Require All Answers: $_requireAllAnswers');
    print('LOGAPP PAGE: Current State Status: ${state.status}');
    print('LOGAPP PAGE: Answer Count: ${state.answerCount}');
    print('LOGAPP PAGE: Total Questions: ${state.question.data.length}');
    print('LOGAPP PAGE: CheckBox Answer Count: ${state.checkBoxAnswer.length}');
    
    // Skip validation if testing mode is enabled
    if (!_requireAllAnswers) {
      print('LOGAPP PAGE: Skipping validation (testing mode)');
      // Show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return const AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Memproses..."),
              ],
            ),
          );
        },
      );
      
      print('LOGAPP PAGE: Dispatching HasilCarian event...');
      context.read<QuestionsBloc>().add(SearchResults());
      print('LOGAPP PAGE: ========== HANDLE BUTTON PRESS END (Testing Mode) ==========');
      return;
    }
    
    // Normal validation flow for production
    print('LOGAPP PAGE: Validating form...');
    if (_formKey.currentState!.validate()) {
      print('LOGAPP PAGE: Form validation passed');
      if (_allQuestionsAnswered(state)) {
        print('LOGAPP PAGE: All questions answered');
        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return const AlertDialog(
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Memproses..."),
                ],
              ),
            );
          },
        );
        
        print('LOGAPP PAGE: Dispatching HasilCarian event...');
        context.read<QuestionsBloc>().add(SearchResults());
        print('LOGAPP PAGE: ========== HANDLE BUTTON PRESS END (Success) ==========');
      } else {
        print('LOGAPP PAGE: Not all questions answered - showing dialog');
        _showDialog(context);
        print('LOGAPP PAGE: ========== HANDLE BUTTON PRESS END (Incomplete) ==========');
      }
    } else {
      print('LOGAPP PAGE: Form validation failed - showing dialog');
      _showDialog(context, 'Sila jawab semua soalan sebelum meneruskan.');
      print('LOGAPP PAGE: ========== HANDLE BUTTON PRESS END (Validation Failed) ==========');
    }
  }

  bool _allQuestionsAnswered(QuestionsState state) {
    // Skip validation if testing mode is enabled
    if (!_requireAllAnswers) {
      return true;
    }
    
    if (state.checkBoxAnswer.isEmpty) {
      return false;
    }

    for (var i = 0; i < state.question.data.length; i++) {
      final answer = state.checkBoxAnswer[i];
      if (answer.id.isEmpty || answer.answer.isEmpty) {
        return false;
      }
    }

    return true;
  }

  void _showDialog(BuildContext context, [String? message]) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Perhatian',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message ?? 'Sila jawab semua soalan sebelum meneruskan.',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProgressIndicatorWidget extends StatefulWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  State<ProgressIndicatorWidget> createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsBloc, QuestionsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              radius: 40.0,
              lineWidth: 7.0,
              percent: state.question.total != 0
                  ? state.answerCount / state.question.data.length
                  : 0.0,
              center: Text(
                state.question.total != 0
                    ? '${(state.answerCount / state.question.total * 100).toStringAsFixed(0)}%'
                    : '0%',
                style: TextStyleMadani.textStyle.interAppbar.copyWith(
                  color: context
                          .watch<AccessibilityCubit>()
                          .state
                          .resetColor
                      ? getThemePrimaryColor(0)
                      : getThemePrimaryColor(context
                          .watch<AccessibilityCubit>()
                          .state
                          .indexColor),
                  fontSize: 13.sp,
                ),
              ),
              backgroundColor: Colors.grey.withOpacity(0.5),
              progressColor: context
                      .watch<AccessibilityCubit>()
                      .state
                      .resetColor
                  ? getThemePrimaryColor(0)
                  : getThemePrimaryColor(context
                      .watch<AccessibilityCubit>()
                      .state
                      .indexColor),
            ),
            SizedBox(width: 21.w),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220.w,
                    child: Text(
                      'Sila jawab semua soalan di bawah.',
                      style: TextStyleMadani.textStyle.interMedium.copyWith(
                        color: Colors.black,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _animationController.forward(from: 0);
                      context.read<QuestionsBloc>().add(InitialValueAnswer());
                    },
                    child: Container(
                      height: 24,
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFDCA0A),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Isi semula',
                            style: TextStyleMadani.textStyle.interText.copyWith(
                              color: context
                                      .watch<AccessibilityCubit>()
                                      .state
                                      .resetColor
                                  ? getThemePrimaryColor(0)
                                  : getThemePrimaryColor(context
                                      .watch<AccessibilityCubit>()
                                      .state
                                      .indexColor),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          RotationTransition(
                            turns: _animation,
                            child: Icon(
                              Icons.refresh_rounded,
                              size: 18.r,
                              color: context
                                      .watch<AccessibilityCubit>()
                                      .state
                                      .resetColor
                                  ? getThemePrimaryColor(0)
                                  : getThemePrimaryColor(context
                                      .watch<AccessibilityCubit>()
                                      .state
                                      .indexColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class DynamicQuestion extends StatelessWidget {
  const DynamicQuestion({
    super.key,
    required this.questions,
    required this.answers,
    required this.answerType,
    required this.answerIndex,
    required this.id,
  });

  final String questions;
  final List<String> answers; // These are VALUES from API
  final String answerType;
  final int answerIndex;
  final String id;
  
  // Helper to get label for a value
  String _getLabel(BuildContext context, String value) {
    final bloc = context.read<QuestionsBloc>();
    final question = context.read<QuestionsBloc>().state.question.data[answerIndex];
    return bloc.getLabel(question.criteriaRefId, value) ?? value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildQuestionText(),
        SizedBox(height: 16.h),
        if (answerType == 'radio-button') ..._buildRadioButtons(context),
        if (answerType == 'checkbox') ..._buildCheckboxes(context),
        if (answerType == 'dropdown-year') _buildDropdownYear(context),
        if (answerType == 'dropdown') _buildDropdown(context),
      ],
    );
  }

  Widget _buildQuestionText() {
    return Text(
      questions,
      style: TextStyleMadani.textStyle.interText.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: MadaniColor.black,
        height: 1.4,
      ),
    );
  }

  List<Widget> _buildRadioButtons(BuildContext context) {
    return answers.map((value) {
      final label = _getLabel(context, value);
      return RadioListTile<String>(
        contentPadding: EdgeInsets.zero,
        dense: true,
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: context
                .watch<AccessibilityCubit>()
                .state
                .resetColor
            ? getThemePrimaryColor(0)
            : getThemePrimaryColor(context
                .watch<AccessibilityCubit>()
                .state
                .indexColor),
        title: Text(
          label, // Display label
          style: TextStyleMadani.textStyle.interText.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: MadaniColor.black,
          ),
        ),
        value: value, // Store value
        groupValue: context.read<QuestionsBloc>().state.answers[answerIndex],
        onChanged: (selectedValue) => _onRadioChanged(context, selectedValue),
        visualDensity: VisualDensity.compact,
      );
    }).toList();
  }

  void _onRadioChanged(BuildContext context, String? value) {
    print('LOGAPP PAGE: Radio Changed - Question Index: $answerIndex, ID: $id, Value: $value');
    context.read<QuestionsBloc>().add(StoreAnswer(
          answer: AnswerModel(id: id, answer: [value!]),
          id: id,
          questionAnswer: value,
          answerIndex: answerIndex,
        ));
    print('LOGAPP PAGE: StoreAnswer event dispatched for radio button');
  }

  List<Widget> _buildCheckboxes(BuildContext context) {
    final selectedAnswers =
        context.read<QuestionsBloc>().state.checkboxQuestion[answerIndex];

    return answers.map((value) {
      final label = _getLabel(context, value);
      final isChecked = selectedAnswers.contains(value);
      return Container(
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: MadaniColor.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: context
                  .watch<AccessibilityCubit>()
                  .state
                  .resetColor
              ? getThemePrimaryColor(0)
              : getThemePrimaryColor(context
                  .watch<AccessibilityCubit>()
                  .state
                  .indexColor),
          title: Text(
            label, // Display label
            style: TextStyleMadani.textStyle.interText.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: MadaniColor.black,
            ),
          ),
          value: isChecked,
          onChanged: (checked) => _onCheckboxChanged(context, value, checked),
          visualDensity: VisualDensity.compact,
        ),
      );
    }).toList();
  }

  void _onCheckboxChanged(BuildContext context, String value, bool? checked) {
    print('LOGAPP PAGE: Checkbox Changed - Question Index: $answerIndex, ID: $id, Value: $value, Selected: $checked');
    context.read<QuestionsBloc>().add(CheckBoxAnswer(
          answer: value, // Store value
          answerIndex: answerIndex,
          selected: checked ?? false,
        ));
    context.read<QuestionsBloc>().add(StoreAnswer(
          answer: AnswerModel(id: id, answer: [value]),
          questionAnswer: value,
          answerIndex: answerIndex,
          id: id,
        ));
    print('LOGAPP PAGE: CheckBoxAnswer and StoreAnswer events dispatched');
  }

  Widget _buildDropdownYear(BuildContext context) {
    final selectedValue = context.read<QuestionsBloc>().state.answers[answerIndex];

    // Use years from API (answers contains year values as strings from API)
    // Display label, store value
    List<DropdownMenuItem<String>> dropdownItems = answers.map((value) {
      final label = _getLabel(context, value);
      return DropdownMenuItem<String>(
        value: value, // Store value
        child: Text(
          label, // Display label
          style: TextStyleMadani.textStyle.interText.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: MadaniColor.black,
          ),
        ),
      );
    }).toList();

    return DropdownButtonFormField<String>(
      isDense: true,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: MadaniColor.black,
        size: 20.r,
      ),
      dropdownColor: MadaniColor.white,
      style: TextStyleMadani.textStyle.interText.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: MadaniColor.black,
      ),
      decoration: _dropdownDecoration(context, 'Sila Pilih'),
      items: dropdownItems,
      onChanged: (value) => _onDropdownYearChanged(context, value),
      value: selectedValue.isEmpty ? null : selectedValue,
      validator: (value) => _dropdownValidator(value, 'Sila pilih tahun.'),
    );
  }

  void _onDropdownYearChanged(BuildContext context, String? value) {
    print('LOGAPP PAGE: Dropdown Year Changed - Question Index: $answerIndex, ID: $id, Value: $value');
    context.read<QuestionsBloc>().add(
          StoreAnswer(
            answer: AnswerModel(id: id, answer: [value!]),
            id: id,
            questionAnswer: value,
            answerIndex: answerIndex,
          ),
        );
    print('LOGAPP PAGE: StoreAnswer event dispatched for dropdown year');
  }

  Widget _buildDropdown(BuildContext context) {
    final selectedValue =
        context.read<QuestionsBloc>().state.answers[answerIndex];

    List<DropdownMenuItem<String>> dropdownItems = answers.map((value) {
      final label = _getLabel(context, value);
      return DropdownMenuItem<String>(
        value: value, // Store value
        child: Text(
          label, // Display label
          style: TextStyleMadani.textStyle.interText.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: MadaniColor.black,
          ),
        ),
      );
    }).toList();

    return DropdownButtonFormField<String>(
      isExpanded: true,
      isDense: true,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: MadaniColor.black,
        size: 20.r,
      ),
      dropdownColor: MadaniColor.white,
      style: TextStyleMadani.textStyle.interText.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: MadaniColor.black,
      ),
      decoration: _dropdownDecoration(context, 'Sila Pilih'),
      items: dropdownItems,
      onChanged: (value) => _onDropdownChanged(context, value),
      value: selectedValue.isEmpty ? null : selectedValue,
      validator: (value) => _dropdownValidator(value, 'Sila pilih.'),
    );
  }

  void _onDropdownChanged(BuildContext context, String? value) {
    print('LOGAPP PAGE: Dropdown Changed - Question Index: $answerIndex, ID: $id, Value: $value');
    context.read<QuestionsBloc>().add(
          StoreAnswer(
            answer: AnswerModel(id: id, answer: [value!.toString()]),
            id: id,
            questionAnswer: value.toString(),
            answerIndex: answerIndex,
          ),
        );
    print('LOGAPP PAGE: StoreAnswer event dispatched for dropdown');
  }

  InputDecoration _dropdownDecoration(BuildContext context, String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: MadaniColor.white,
      hintText: hintText,
      hintStyle: TextStyleMadani.textStyle.interText.copyWith(
        fontSize: 16.sp,
        color: Colors.grey.shade600,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: context
                  .watch<AccessibilityCubit>()
                  .state
                  .resetColor
              ? getThemePrimaryColor(0)
              : getThemePrimaryColor(context
                  .watch<AccessibilityCubit>()
                  .state
                  .indexColor),
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 10.h,
      ),
      isDense: true,
    );
  }

  String? _dropdownValidator<T>(T? value, String errorMessage) {
    if (value == null) {
      return errorMessage;
    }
    return null;
  }
}
