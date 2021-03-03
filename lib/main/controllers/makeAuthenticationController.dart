import 'package:Queszz/data/repositories/user_repository.dart';
import 'package:Queszz/data/usecases/login_impl.dart';
import 'package:Queszz/domain/usecases/login.dart';
import 'package:Queszz/external/datasources/user_remote_datasource_impl.dart';
import 'package:Queszz/infra/datasources/user_remote_datasource.dart';
import 'package:Queszz/infra/repositories/user_repository_impl.dart';
import 'package:Queszz/presentation/controllers/authentication_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

AuthenticationController makeAuthenticationController() {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  final UserRemoteDatasource userRemoteDatasource = UserRemoteDatasourceImpl(
    firebaseAuth: firebaseAuth,
    googleSignIn: googleSignIn,
  );

  final UserRepository userRepository = UserRepositoryImpl(
    userRemoteDatasource,
  );

  final Login login = LoginImpl(userRepository);

  final AuthenticationController authenticationController =
      AuthenticationController(
    firebaseAuth: firebaseAuth,
    login: login,
  );

  return authenticationController;
}
