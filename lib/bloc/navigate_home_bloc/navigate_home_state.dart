part of 'navigate_home_bloc.dart';

sealed class NavigateHomeState extends Equatable {
  const NavigateHomeState();

  @override
  List<Object> get props => [];
}

class NavigateHomeInitial extends NavigateHomeState {}

class NavigateHomeSuccess extends NavigateHomeState {}
