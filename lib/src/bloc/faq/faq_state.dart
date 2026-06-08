part of 'faq_bloc.dart';

enum FaqStatus {
  initial,
  loading,
  completed,
  error,
}

@freezed
abstract class FaqState with _$FaqState {
  const factory FaqState({
    required Pagination<FaqModel> faqs,
    required FaqStatus status,
    required String errorMessage,
  }) = _FaqState;

  factory FaqState.initial() => FaqState(
        faqs: Pagination<FaqModel>.initial(),
        status: FaqStatus.initial,
        errorMessage: '',
      );
}

