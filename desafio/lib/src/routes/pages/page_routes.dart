import 'package:desafio/bindings/password/password_binding.dart';
import 'package:desafio/src/pages/password_page.dart';
import 'package:desafio/src/pages/response_page.dart';
import 'package:desafio/src/routes/routes/routes_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.passwordPage,
      page: () => const PasswordPage(),
      binding: PasswordBinding(),
    ),
    GetPage(
      name: Routes.responsePage,
      page: () => const ResponsePage(),
    ),
  ];
}
