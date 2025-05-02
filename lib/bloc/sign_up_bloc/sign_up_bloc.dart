import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepo _userRepository;
  final FirestoreRepo _firestoreRepo;
  SignUpBloc(
      {required UserRepo userRepository,
      required FirestoreRepo firestoreRepository})
      : _userRepository = userRepository,
        _firestoreRepo = firestoreRepository,
        super(SignUpInitial()) {
    on<SignUpEmail>((event, emit) async {
      emit(SignUpProcess());
      try {
        final MyUser user =
            await _userRepository.signUpWithEmail(event.user, event.password);
        await _firestoreRepo.setUserData(user);
        await _firestoreRepo.deleteOtp(event.mailOrPhone);
        emit(SignUpSuccess());
      } catch (e) {
        log(e.toString());
        emit(SignUpFailure());
      }
    });

    on<SignUpPhone>((event, emit) async {
      emit(SignUpProcess());
      try {
        final MyUser user = await _userRepository.verifyPhone(
          event.user,
          event.smsOtp,
        );
        await _firestoreRepo.setUserData(user);
        emit(SignUpSuccess());
      } catch (e) {
        log(e.toString());
        emit(SignUpFailure());
      }
    });

    on<GoogleSignIn>((event, emit) async {
      emit(SignUpProcess());
      try {
        final user = await _userRepository.signInWithGoogle();
        await _firestoreRepo.setUserData(user);
        emit(SignUpSuccess());
      } catch (e) {
        log(e.toString());
        emit(SignUpFailure());
      }
    });

   
  }
}
