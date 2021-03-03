import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:Queszz/domain/entities/user.dart';
import 'package:Queszz/domain/helpers/exceptions.dart';
import 'package:Queszz/domain/usecases/login.dart';
import 'package:Queszz/infra/datasources/user_remote_datasource.dart';

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  UserRemoteDatasourceImpl({
    @required this.firebaseAuth,
    @required this.googleSignIn,
  });

  @override
  Future<User> login(LoginParams params) async {
    try {
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final user = await firebaseAuth.signInWithCredential(credential);

      return User(
        name: user.user.displayName,
        email: user.user.email,
        image: user.user.photoURL,
      );
    } catch (e) {
      throw ServerException();
    }
  }
}
