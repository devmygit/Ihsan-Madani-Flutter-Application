import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'carousel_poster_state.dart';
part 'carousel_poster_cubit.freezed.dart';

class CarouselPosterCubit extends Cubit<CarouselPosterState> {
  CarouselPosterCubit() : super(CarouselPosterState.initial());
  void currentPage({required int index}) => emit(
        state.copyWith(
          index: index,
        ),
      );
}
