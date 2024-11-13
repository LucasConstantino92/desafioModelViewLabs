import 'package:desafio/data/api/api_service.dart';
import 'package:desafio/data/models/password/password_model.dart';
import 'package:desafio/data/models/response/response_model.dart';
import 'package:desafio/domain/repositories/password/i_password_repository.dart';
import 'package:desafio/domain/urls/api/enpoints/enpoints.dart';

class PasswordRepository implements IPasswordRepository {
  final ApiService apiService;

  PasswordRepository({required this.apiService});

  @override
  Future<PasswordResponse?> generateRandom() async {
    return await apiService.getRequest<PasswordResponse>(
      Enpoints.generateRandom,
      (json) => PasswordResponse.fromJson(json),
    );
  }

  @override
  Future<ValidateResponse?> validatePassword(Map<String, dynamic> body) async {
    final response = await apiService.postRequest<ValidateResponse>(
      Enpoints.validadePassword,
      body,
      (json) => _handleValidateResponse(json),
    );
    return response;
  }

  ValidateResponse _handleValidateResponse(Map<String, dynamic> json) {
    final statusCode = json['statusCode'] ?? 200;
    return ValidateResponse.fromJson(json, statusCode);
  }
}
