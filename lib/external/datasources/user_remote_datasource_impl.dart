import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:Queszz/domain/helpers/exceptions.dart';
import 'package:Queszz/infra/datasources/user_remote_datasource.dart';

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  UserRemoteDatasourceImpl({
    @required this.firebaseAuth,
    @required this.googleSignIn,
  });

  @override
  Future<void> login() async {
    try {
      final googleUser = await googleSignIn.signIn().catchError((error) {});

      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        return await firebaseAuth.signInWithCredential(credential);
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
