import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

class FirestoreUserRepository extends FirestoreRepo {
  FirestoreUserRepository({
    FirebaseFirestore? firestoreInstance,
  }) : _firestoreInstance = firestoreInstance ?? FirebaseFirestore.instance;
  final FirebaseFirestore _firestoreInstance;
  final userCollection = FirebaseFirestore.instance.collection('user');
  final otpCollection = FirebaseFirestore.instance.collection('otp');

  @override
  Future<void> setUserData(MyUser user) async {
    try {
      log('firestore id : ${user.id}');
      await userCollection.doc(user.id).set(user.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> getUser(String userId) async {
    try {
      return await userCollection.doc(userId).get().then((value) =>
          MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setOtp(int otp, String mailOrPhone) async {
    try {
      await otpCollection.doc(mailOrPhone).set({'otp': otp});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<int?> getOtp(String mailOrPhone) async {
    try {
      final DocumentSnapshot doc = await otpCollection.doc(mailOrPhone).get();
      if (doc.exists && doc.data() != null) {
        final data = doc.data() as Map<String, dynamic>;
        log(' otp is : ${data['otp']}');
        return data['otp'] as int;
      }
      return null;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteOtp(String mailOrPhone) async {
    try {
      await otpCollection.doc(mailOrPhone).delete();
      log('deleted otp ${otpCollection.doc(mailOrPhone)}');
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetOtp(String mailOrPhone, int otp) async {
    try {
      await otpCollection.doc(mailOrPhone).update({'otp': otp});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> isEmailExit(String email) async {
    final query = await _firestoreInstance
        .collection('user')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    log('email exist :${query.docs.isNotEmpty} ');

    return query.docs.isNotEmpty;
  }

  @override
  Future<bool> isPhoneExit(String phone) async {
    final query = await _firestoreInstance
        .collection('user')
        .where('number', isEqualTo: phone)
        .limit(1)
        .get();
    log('number exist :${query.docs.isNotEmpty} ');

    return query.docs.isNotEmpty;
  }

  @override
  Future<bool> isUsernameExit(String username) async {
    log(username);
    final query = await _firestoreInstance
        .collection('user')
        .where('name', isEqualTo: username)
        .limit(1)
        .get();
    log('username exist :${query.docs.isNotEmpty} ');
    return query.docs.isNotEmpty;
  }

  @override
  Future<String> getUserWithNumber(String phoneNo, String password) async {
    try {
      final query = await _firestoreInstance
          .collection('user')
          .where('number', isEqualTo: phoneNo)
          .limit(1)
          .get();

      if (query.docs.isEmpty) {
        return 'User not found. Please try again.';
      }
      final userData = query.docs.first.data();

      if (userData['password'] != password) {
        return 'Incorrect password.Please try again.';
      }
      return userData['email'];
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  @override
  Future<String> getUserWithname(String username, String password) async {
    try {
      final query = await _firestoreInstance
          .collection('user')
          .where('name', isEqualTo: username)
          .limit(1)
          .get();

      if (query.docs.isEmpty) {
        return 'User not found. Please try again.';
      }
      final userData = query.docs.first.data();

      if (userData['password'] != password) {
        return 'Incorrect password.Please try again.';
      }
      return userData['email'];
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  @override
  Future<String?> getEmailWithName(String username) async {
    try {
      final query = await _firestoreInstance
          .collection('user')
          .where('name', isEqualTo: username)
          .limit(1)
          .get();

      if (query.docs.isEmpty) return null;
      return query.docs.first.data()['email'];
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<String?> getUserId(String identifiers) async {
    try {
      if (RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(identifiers)) {
        final query = await _firestoreInstance
            .collection('user')
            .where('email', isEqualTo: identifiers)
            .limit(1)
            .get();
        return query.docs.isNotEmpty ? query.docs.first.id : null;
      } else if (RegExp(r'^[0-9]{10}$').hasMatch(identifiers)) {
        final query = await _firestoreInstance
            .collection('user')
            .where('number', isEqualTo: identifiers)
            .limit(1)
            .get();
        return query.docs.isNotEmpty ? query.docs.first.id : null;
      } else {
        final query = await _firestoreInstance
            .collection('user')
            .where('name', isEqualTo: identifiers)
            .limit(1)
            .get();
        return query.docs.isNotEmpty ? query.docs.first.id : null;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updatePassword(String newPassword, String userId) async {
    try {
      await userCollection.doc(userId).update({'password': newPassword});
      log('updated password ${userCollection.doc(userId).get()}');
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<String?> getPassword(String id) async {
    try {
      final query = await _firestoreInstance.collection('user').doc(id).get();

      if (query.exists) {
        final data = query.data();
        return data?['password'] as String?;
      }
      return null;
    } catch (e) {
      log('Error retrieving password: $e');
      rethrow;
    }
  }

  @override
  Future<String?> getEmailById(String id) async {
    try {
      final query = await _firestoreInstance.collection('user').doc(id).get();

      if (query.exists) {
        final data = query.data();
        return data?['email'] as String?;
      }
      return null;
    } catch (e) {
      log('Error retrieving email: $e');
      rethrow;
    }
  }
}
