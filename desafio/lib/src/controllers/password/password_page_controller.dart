import 'package:desafio/data/models/response/response_model.dart';
import 'package:get/get.dart';
import 'package:desafio/data/models/password/password_model.dart';
import 'package:desafio/data/repositories/password/password_repository.dart';

class PasswordController extends GetxController {
  final PasswordRepository passwordRepository;
  var passwordResponse = Rx<PasswordResponse?>(null);
  var validateResponse = Rx<ValidateResponse?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  PasswordController({required this.passwordRepository});

  // Método para gerar a senha
  Future<void> generateRandomPassword() async {
    isLoading(true);
    errorMessage('');
    try {
      final response = await passwordRepository.generateRandom();
      passwordResponse.value = response;
    } catch (e) {
      errorMessage.value = 'Erro ao gerar senha: $e';
    } finally {
      isLoading(false);
    }
  }

  // Método para verificar validação de senha
  Future<void> validatePassword({required String password}) async {
    isLoading(true);
    errorMessage('');
    final body = {'password': password};
    try {
      final response = await passwordRepository.validatePassword(body);
      validateResponse.value = response;
    } catch (e) {
      errorMessage.value = '$e';
    } finally {
      isLoading(false);
    }
  }
}
