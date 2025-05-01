import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigate_home_event.dart';
part 'navigate_home_state.dart';

class NavigateHomeBloc extends Bloc<NavigateHomeEvent, NavigateHomeState> {
  NavigateHomeBloc() : super(NavigateHomeInitial()) {
    on<NavigateToHome>((event, emit) {
      emit(NavigateHomeSuccess());
    });
  }
}
