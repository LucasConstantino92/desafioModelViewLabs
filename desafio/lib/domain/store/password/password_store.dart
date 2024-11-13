import 'package:desafio/data/models/response/response_model.dart';
import 'package:desafio/data/repositories/password/password_repository.dart';
import 'package:flutter/material.dart';
import 'package:desafio/data/models/password/password_model.dart';

class PasswordStore with ChangeNotifier {
  final PasswordRepository passwordRepository;

  PasswordStore({required this.passwordRepository});

  PasswordResponse? _passwordResponse;
  PasswordResponse? get passwordResponse => _passwordResponse;
  ValidateResponse? _validateResponse;
  ValidateResponse? get validateResponse => _validateResponse;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Método para gerar senha
  Future<void> generatePassword() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await passwordRepository.generateRandom();
      if (response != null) {
        _passwordResponse = response;
      } else {
        _passwordResponse = null;
      }
    } catch (e) {
      _passwordResponse = null;
      print("Erro ao gerar senha: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  // Método para verificar validação de password
  Future<void> validatePassword({required Map<String, dynamic> body}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await passwordRepository.validatePassword(body);
      if (response != null) {
        _validateResponse = response;
      } else {
        _validateResponse = null;
      }
    } catch (e) {
      _validateResponse = null;
      print("Erro: $e");
    }
  }
}
