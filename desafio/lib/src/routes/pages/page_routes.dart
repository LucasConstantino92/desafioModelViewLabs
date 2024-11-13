import 'package:desafio/src/pages/password_page.dart';
import 'package:desafio/src/pages/response_page.dart';
import 'package:desafio/src/routes/routes/routes_routes.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.passwordPage: (context) => const PasswordPage(),
      Routes.responsePage: (context) => const ResponsePage()
    };
  }
}
