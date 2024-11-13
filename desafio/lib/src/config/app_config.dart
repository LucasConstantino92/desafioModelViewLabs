import 'package:desafio/src/pages/password_page.dart';
import 'package:desafio/src/routes/pages/page_routes.dart';
import 'package:flutter/material.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio ModelViewLabs',
      debugShowCheckedModeBanner: false,
      home: const PasswordPage(),
      routes: PageRoutes.getRoutes(),
    );
  }
}
