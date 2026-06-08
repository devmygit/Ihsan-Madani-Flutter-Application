part of 'carousel_poster_cubit.dart';

@freezed
abstract class CarouselPosterState with _$CarouselPosterState {
  const factory CarouselPosterState({
    required int index,
  }) = _CarouselPosterState;

  factory CarouselPosterState.initial() {
    return const CarouselPosterState(
      index: 0,
    );
  }
}
