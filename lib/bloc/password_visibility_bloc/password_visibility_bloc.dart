import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_visibility_event.dart';
part 'password_visibility_state.dart';


class PasswordVisibilityBloc
    extends Bloc<PasswordVisibilityEvent, PasswordVisibilityChange> {
  PasswordVisibilityBloc({required int fieldCount})
      : super(PasswordVisibilityChange(
            isObscureList: List.filled(fieldCount, true))) {
    on<TogglePasswordVisibility>((event, emit) {
      List<bool> updatedList = List.from(state.isObscureList);
      updatedList[event.fieldIndex] = !updatedList[event.fieldIndex];
      emit(PasswordVisibilityChange(isObscureList: updatedList));
    });
  }
}
