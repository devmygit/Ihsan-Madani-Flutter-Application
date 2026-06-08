import 'package:bloc/bloc.dart';

class GenericCubit<T> extends Cubit<T?> {
  GenericCubit() : super(null);
  GenericCubit.withValue(T super.t);
  void update(T t) => emit(t);
}
