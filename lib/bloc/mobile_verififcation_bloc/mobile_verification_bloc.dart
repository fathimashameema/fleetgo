import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'mobile_verification_event.dart';
part 'mobile_verification_state.dart';

class MobileVerificationBloc
    extends Bloc<MobileVerificationEvent, MobileVerificationState> {
  final UserRepo _userRepository;
  MobileVerificationBloc({
    required UserRepo myUserRepository,
  })  : _userRepository = myUserRepository,
        super(MobileVerificationInitial()) {
    on<VerifyPhone>((event, emit) async {
      emit(MobileVerificationLoading());
      try {
        await _userRepository.verifyPhone(event.phone);
        emit(MobileVerificationSuccess());
      } catch (e) {
        log(e.toString());
        emit(MobileVerificationFailure());
      }
    });
  }
}
