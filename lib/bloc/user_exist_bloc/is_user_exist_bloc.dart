import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'is_user_exist_event.dart';
part 'is_user_exist_state.dart';

class IsUserExistBloc extends Bloc<IsUserExistEvent, IsUserExistState> {
  final FirestoreRepo _firestoreRepo;
  IsUserExistBloc({required FirestoreRepo firestoreRepository})
      : _firestoreRepo = firestoreRepository,
        super(IsUserExistInitial()) {
    on<IsUserExist>((event, emit) async {
      log('isUserExist called');
      try {
        log('isUserExist called in try');

        bool isNameExist = await _firestoreRepo.isUsernameExit(event.userName);
        bool isEmailExist = await _firestoreRepo.isEmailExit(event.email);
        bool isNumberExist = await _firestoreRepo.isPhoneExit(event.number);

        log('user exist value in bloc $isNameExist');

        if (isNameExist == true) {
          emit(UserExist(isNameExist,
              'Username already exist. Try using a different one!'));
          log('emited user exist state');
        } else if (isEmailExist) {
          emit(UserExist(isEmailExist,
              'An account is already registered with this Email.'));
          log('emited user exist state');
        } else if (isNumberExist) {
          emit(UserExist(isNumberExist,
              'Mobile number is already registered with an account.'));
          log('emited user exist state');
        }
      } catch (e) {
        log('error in checking if user exist : ${e.toString()}');
      }
    });
    on<ClearUserExistState>((event, emit) {
      emit(IsUserExistInitial());
    });
  }
}
