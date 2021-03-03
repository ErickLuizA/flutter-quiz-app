import 'package:Queszz/domain/entities/user.dart';
import 'package:Queszz/domain/usecases/login.dart';

abstract class UserRemoteDatasource {
  Future<User> login(LoginParams params);
}
