part of 'navigate_home_bloc.dart';

abstract class NavigateHomeEvent extends Equatable {
  const NavigateHomeEvent();

  @override
  List<Object> get props => [];
}

class NavigateToHome extends NavigateHomeEvent {
  const NavigateToHome();
}
