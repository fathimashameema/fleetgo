import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/models.dart';

abstract class UserRepo {
  Stream<User?> get user;
  Future<MyUser> signUpWithEmail(MyUser user, String password);
  Future<void> signUpWithPhone(String phone);
  Future<MyUser> signInWithGoogle();
  Future<void> verifyEmail(String email, int otp);
  Future<MyUser> verifyPhone(MyUser myUser, String smsOtp);
  Future<String?> signInWithEmail(String email, String password);
  Future<String?> signInWithNumber(String phoneNo, String password);
  Future<String?> signInWithUsername(String username, String password);
  Future<String?> signIn(String identifier, String password);

  Future<void> logoOut();
  Future<void> resetPassword(String email);
}
