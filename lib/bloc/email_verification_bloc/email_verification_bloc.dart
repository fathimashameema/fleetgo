import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'email_verification_event.dart';
part 'email_verification_state.dart';

class EmailVerificationBloc
    extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  final FirestoreRepo _firestoreRepo;
  final UserRepo _userRepo;
  EmailVerificationBloc(
      {required FirestoreRepo firestoreRepository,
      required UserRepo userRepository})
      : _firestoreRepo = firestoreRepository,
        _userRepo = userRepository,
        super(EmailVerificationInitial()) {
    on<VerifyOtp>((event, emit) async {
      emit(EmailVerificationLoading());
      try {
        final otpStored = await _firestoreRepo.getOtp(event.mailOrPhone);
        if (otpStored != null && otpStored == event.otp) {
          emit(EmailVerificationSuccess());
        } else if (otpStored == null) {
          emit(const EmailVerificationFailure(error: 'otp is null'));
        } else {
          emit(const EmailVerificationFailure(error: 'Incorrect OTP'));
        }
      } catch (e) {
        log(e.toString());
        emit(const EmailVerificationFailure(
            error: 'Something went wrong, Please try again'));
      }
    });

    on<ResentOtp>((event, emit) async {
      try {
        await _userRepo.verifyEmail(event.mailOrPhone, event.otp);

        await _firestoreRepo.resetOtp(event.mailOrPhone, event.otp);

        // emit(EmailVerificationLoading());
      } catch (e) {
        log(e.toString());
        emit(const EmailVerificationFailure(
            error: 'Something went wrong, Please try again'));
      }
    });

    on<VerifyEmail>((event, emit) async {
      try {
        await _userRepo.verifyEmail(event.email, event.otp);
        await _firestoreRepo.setOtp(
          event.otp,
          event.email,
        );
        // emit(EmailVerificationLoading());
      } catch (e) {
        log(e.toString());
        emit(const EmailVerificationFailure(
            error: 'Something went wrong, Please try again'));
      }
    });
  }
}
