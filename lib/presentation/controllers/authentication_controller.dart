import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:Queszz/domain/usecases/login.dart';

class AuthenticationController extends ChangeNotifier {
  final Login login;
  final FirebaseAuth firebaseAuth;

  AuthenticationController({
    @required this.login,
    @required this.firebaseAuth,
  });

  Future<bool> signIn() async {
    final result = await login.execute();

    return result.fold((fail) => false, (success) => true);
  }

  Stream<User> authState() => firebaseAuth.authStateChanges();
}
