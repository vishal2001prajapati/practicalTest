import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navigation_cubit.freezed.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState(0));

  void changeIndex(int newIndex) {
    emit(BottomNavigationState(newIndex));
  }
}
