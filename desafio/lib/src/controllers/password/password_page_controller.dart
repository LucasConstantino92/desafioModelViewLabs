import 'package:desafio/data/models/response/response_model.dart';
import 'package:desafio/src/dialogs/error_dialog.dart';
import 'package:desafio/src/pages/response_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:desafio/data/models/password/password_model.dart';
import 'package:desafio/domain/repositories/password/i_password_repository.dart';

class PasswordController extends GetxController {
  final IPasswordRepository passwordRepository;

  var passwordResponse = Rx<PasswordResponse?>(null);
  var validateResponse = Rx<ValidateResponse?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  var obscureTxt = true.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PasswordController({required this.passwordRepository});

  // Método para gerar a senha
  Future<void> generateRandomPassword() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final response = await passwordRepository.generateRandom();
      passwordResponse.value = response;
      passwordController.text = response!.password;
      update();
    } catch (e) {
      errorMessage.value = 'Erro ao gerar senha: $e';
      ErrorDialog.show(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // Método para verificar validação de senha
  Future<void> validatePassword({required String password}) async {
    isLoading.value = true;
    errorMessage.value = '';
    final body = {'password': password};
    try {
      final response = await passwordRepository.validatePassword(body);
      validateResponse.value = response;
      if (response!.message == 'Senha válida!') {
        Get.to(() => const ResponsePage(), transition: Transition.rightToLeft);
        passwordController.clear();
        rePasswordController.clear();
      } else {
        ErrorDialog.show(response.message);
      }
    } catch (e) {
      errorMessage.value = 'Erro ao validar senha: $e';
      ErrorDialog.show(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
