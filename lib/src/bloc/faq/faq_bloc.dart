import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madani/src/index.dart';

part 'faq_event.dart';
part 'faq_state.dart';
part 'faq_bloc.freezed.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc() : super(FaqState.initial()) {
    on<GetFaqs>(_getFaqs);
  }

  Future<void> _getFaqs(GetFaqs event, Emitter emit) async {
    try {
      emit(state.copyWith(status: FaqStatus.loading));
      print('LOGAPP BLOC: GetFaqs event - page value: ${event.page}');

      Pagination<FaqModel> faqs = await FaqRepo().getFaqs(page: event.page);

      // If page > 0, append to existing data. If page = 0, replace data (first load)
      final List<FaqModel> newFaqs =
          event.page > 0 ? [...state.faqs.data] : [];

      print('LOGAPP BLOC: FAQ - page: ${event.page}, existing data: ${state.faqs.data.length}, new data from API: ${faqs.data.length}, will append: ${event.page > 0}');

      emit(state.copyWith(
        status: FaqStatus.completed,
        faqs: faqs.copyWith(
          data: [
            ...newFaqs,
            ...faqs.data,
          ],
        ),
      ));
      
      print('LOGAPP BLOC: FAQ - Final data count after merge: ${state.faqs.data.length}');
    } on HttpException catch (e) {
      log('Error getting FAQs: $e');
      emit(state.copyWith(
        status: FaqStatus.error,
        errorMessage: 'Error getting FAQs: $e',
      ));
    } catch (e) {
      log('Error getting FAQs: $e');
      emit(state.copyWith(
        status: FaqStatus.error,
        errorMessage: 'Error getting FAQs: $e',
      ));
    }
  }
}

