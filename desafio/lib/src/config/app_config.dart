import 'package:desafio/bindings/password/password_binding.dart';
import 'package:desafio/src/pages/password_page.dart';
import 'package:desafio/src/routes/pages/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: GetMaterialApp(
        title: 'Desafio ModelViewLabs',
        debugShowCheckedModeBanner: false,
        home: const PasswordPage(),
        getPages: PageRoutes.pages,
        initialBinding: PasswordBinding(),
      ),
    );
  }
}
