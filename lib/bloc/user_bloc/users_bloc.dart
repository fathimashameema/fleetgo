import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepo _userRepo;
  final FirestoreRepo _firestoreRepo;
  UsersBloc(
      {required UserRepo userRepository,
      required FirestoreRepo firestoreRepository})
      : _userRepo = userRepository,
        _firestoreRepo = firestoreRepository,
        super(const UsersState.loading()) {
    on<GetMyUser>((event, emit) async {
      try {
        MyUser user = await _firestoreRepo.getUser(event.userId);
        emit(UsersState.success(user));
      } catch (e) {
        log(e.toString());
        emit(const UsersState.failure());
      }
    });
  }
}
