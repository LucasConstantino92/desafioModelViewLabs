import 'package:desafio/data/api/api_service.dart';
import 'package:desafio/data/repositories/password/password_repository.dart';
import 'package:desafio/domain/repositories/password/i_password_repository.dart';
import 'package:desafio/src/controllers/password/password_page_controller.dart';
import 'package:get/get.dart';

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    // Injetar ApiService
    Get.lazyPut<ApiService>(() => ApiService());

    // Injetar IPasswordRepository como PasswordRepository
    Get.lazyPut<IPasswordRepository>(
        () => PasswordRepository(apiService: Get.find<ApiService>()));

    // Injetar PasswordController, que espera um IPasswordRepository
    Get.lazyPut<PasswordController>(() => PasswordController(
        passwordRepository: Get.find<IPasswordRepository>()));
  }
}
