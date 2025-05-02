import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepo _userRepo;
  SignInBloc({required UserRepo userRepository})
      : _userRepo = userRepository,
        super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInProcess());
      log('sign in requiured executed');
      try {
        final errorMessage =
            await _userRepo.signIn(event.identifier, event.password);
        if (errorMessage != null) {
          emit(SignInFailure(message: errorMessage));
        } else {
          emit(SignInSuccess());
        }
      } catch (e) {
        log(e.toString());
        emit(const SignInFailure(
            message: 'An unknown error occured.Please try again.'));
      }
    });

    on<SignOutRequired>((event, emit) async {
      try {
        await _userRepo.logoOut();
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
