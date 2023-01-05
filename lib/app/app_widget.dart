import 'package:e_log_social/app/modules/login/views/pages/login_page.dart';
import 'package:e_log_social/app/modules/refer-and-win/views/pages/refer_and_win.dart';
import 'package:e_log_social/app/modules/register/views/pages/successful_registration_page.dart';
import 'package:e_log_social/app/modules/register/views/pages/register_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/refer-and-win': (context) => const ReferAndWinPage(),
        '/register-page': (context) => const RegisterPage(),
        '/successful-registration': (context) =>
            const SuccessfulRegistrationPage(),
      },
    );
  }
}
