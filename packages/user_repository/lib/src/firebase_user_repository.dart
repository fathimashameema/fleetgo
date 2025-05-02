import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:user_repository/user_repository.dart';

class FirebaseUserRepository implements UserRepo {
  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('user');
  String storedVerificationId = '';
  FirestoreRepo firestoreRepo = FirestoreUserRepository();

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }

  @override
  Future<MyUser> signUpWithEmail(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );

      myUser = myUser.copyWith(id: user.user!.uid);
      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> verifyEmail(String email, int otp) async {
    final smtpServer = gmail("fleetgo.rides@gmail.com", "gkcr fmhl hwgr ojvn");

    log(email);

    final message = Message()
      ..from = const Address("fleetgo.rides@gmail.com", "Fleetgo")
      ..recipients.add(email)
      ..subject = "Your Fleetgo code is $otp"
      ..html = """
  <html>
  <body style="font-family: Arial, sans-serif; color: #333; font-size: 15px; ">
    
    <p>Your Fleetgo verification code is:</p>
    
    <p style="font-size: 28px; font-weight: bold; color: #a6a2a2; text-align: center;">$otp</p>
    
    <p>Please enter this code to complete your verification process.</p>
    
    <p>For some security reasons, don't share it with anyone..</p>
    
    <p>Best regards,<br><b>FleetGo Team</b></p>
  </body>
  </html>
  """;
    try {
      final sendReport =
          await send(message, smtpServer, timeout: const Duration(minutes: 5));
      log("OTP Sent: ${sendReport.toString()}");
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signUpWithPhone(
    String phone,
  ) async {
    try {
      phone = "+91${phone.trim()}";

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) async {
          // await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          log('Verification failed: ${error.message}');
        },
        codeSent: (verificationId, forceResendingToken) {
          // navigate(verificationId);
          storedVerificationId = verificationId;
          log('otp sent : $verificationId');
        },
        codeAutoRetrievalTimeout: (verificationId) {
          log('auto retrieval time out');
          storedVerificationId = verificationId;
        },
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> verifyPhone(MyUser myUser, String smsOtp) async {
    try {
      final cred = await _firebaseAuth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: storedVerificationId, smsCode: smsOtp));
      log('verification id in function : $storedVerificationId');
      log('phone user : ${cred.user}');
      myUser = myUser.copyWith(id: cred.user!.uid);
      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth?.idToken,
              accessToken: googleAuth?.accessToken));
      final user = cred.user;
      final MyUser myUser = MyUser(
          id: user?.uid ?? '',
          email: user?.email ?? '',
          name: user?.displayName ?? '',
          number: user?.phoneNumber ?? '',
          password: '');
      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<String?> signInWithEmail(String email, String password) async {
    try {
      log('sign in method called');
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('user signed in');
      return null;
    } on FirebaseAuthException catch (e) {
      // log('error signing in ${e.toString()}');
      log('error signing in code ${e.code}');

      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage =
              'The email address is badly formatted.Please try again.';
          break;
        case 'user-disabled':
          errorMessage = 'This user has been disabled.Please try again.';
          break;
        case 'invalid-credential':
          errorMessage = 'Invalid Username or Password.Please try again.';
          break;

        default:
          errorMessage = 'Login failed. Please try again.';
      }
      return errorMessage;
    } catch (e) {
      log(e.toString());
      return 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<String?> signInWithNumber(String phoneNo, String password) async {
    try {
      final message = await firestoreRepo.getUserWithNumber(phoneNo, password);
      log(message);
      if (RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(message)) {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: message,
          password: password,
        );
        return null;
      } else {
        return message;
      }
    } catch (e) {
      log(e.toString());
      return 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<String?> signInWithUsername(String username, String password) async {
    try {
      final message = await firestoreRepo.getUserWithname(username, password);
      log(message);
      if (RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(message)) {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: message,
          password: password,
        );
        return null;
      } else {
        return message;
      }
    } catch (e) {
      log(e.toString());
      return 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  Future<String?> signIn(String identifier, String password) async {
    if (RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(identifier)) {
      return signInWithEmail(identifier, password);
    } else if (RegExp(r'^[0-9]{10}$').hasMatch(identifier)) {
      return signInWithNumber(identifier, password);
    } else {
      return signInWithUsername(identifier, password);
    }
  }

  @override
  Future<void> logoOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
