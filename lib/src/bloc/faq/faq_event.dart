part of 'faq_bloc.dart';

@freezed
abstract class FaqEvent with _$FaqEvent {
  const factory FaqEvent.getFaqs({@Default(0) int page}) = GetFaqs;
}

