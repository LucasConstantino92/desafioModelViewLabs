import 'package:desafio/bindings/password/password_binding.dart';
import 'package:desafio/domain/validators/password_validator.dart';
import 'package:desafio/src/controllers/password/password_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final controller = Get.find<PasswordController>();

  @override
  void dispose() {
    controller.passwordController.dispose();
    controller.rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Validação de Senha',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text.rich(TextSpan(children: [
                TextSpan(text: 'Para validar a senha, ela deve conter: \n'),
                TextSpan(text: '- No mínimo 8 caracteres. \n'),
                TextSpan(text: '- Letras maiúsculas e minúsculas. \n'),
                TextSpan(text: '- Ao menos 1 caracter especial \n \n'),
                TextSpan(
                    text:
                        'Se utilizar o gerador de senha, confira a senha e copie para o campo de confirmar senha. \n'),
                TextSpan(
                    text: 'Não esqueça de anotar sua senha para não perde-la.',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ])),
            ),
            Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Obx(
                      () => TextFormField(
                        obscureText: controller.obscureTxt.value,
                        controller: controller.passwordController,
                        cursorColor: Colors.green.shade700,
                        validator: (value) => validatePassword(value ?? ''),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(controller.obscureTxt.value == true
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            onPressed: () {
                              setState(() {
                                controller.obscureTxt.value =
                                    !controller.obscureTxt.value;
                              });
                            },
                          ),
                          label: const Text('Senha'),
                          floatingLabelStyle:
                              TextStyle(color: Colors.green.shade700),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.green.shade700,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.red.shade700,
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.red.shade700,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    TextFormField(
                      obscureText: controller.obscureTxt.value,
                      controller: controller.rePasswordController,
                      cursorColor: Colors.green.shade700,
                      validator: (value) {
                        if (controller.rePasswordController.text !=
                            controller.passwordController.text) {
                          return 'As senhas devem ser iguais';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(controller.obscureTxt.value == true
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {
                            setState(() {
                              controller.obscureTxt.value =
                                  !controller.obscureTxt.value;
                            });
                          },
                        ),
                        label: const Text('Confirme a Senha'),
                        floatingLabelStyle:
                            TextStyle(color: Colors.green.shade700),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.green.shade700,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.red.shade700,
                            width: 2,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.red.shade700,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Obx(
              () => controller.isLoading.value == true
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.generateRandomPassword(),
                  child: const Text(
                    'GERAR SENHA ALEATÓRIA',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16), // Espaço entre os botões
            Expanded(
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState?.validate() ?? false) {
                      controller.validatePassword(
                        password: controller.passwordController.text,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    'VALIDAR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
