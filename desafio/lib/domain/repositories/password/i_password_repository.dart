import 'package:desafio/data/models/password/password_model.dart';
import 'package:desafio/data/models/response/response_model.dart';

abstract class IPasswordRepository {
  Future<PasswordResponse?> generateRandom();
  Future<ValidateResponse?> validatePassword(Map<String, dynamic> map);
}
