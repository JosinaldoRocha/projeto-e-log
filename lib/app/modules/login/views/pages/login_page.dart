import 'package:e_log_social/app/modules/login/data/login_model.dart';
import 'package:e_log_social/app/modules/widgets/button/button_widget.dart';
import 'package:e_log_social/app/modules/widgets/input/info_text_field_widget.dart';
import 'package:e_log_social/app/modules/widgets/texts/box_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  LoginModel item = LoginModel();

  void _navigator() {
    item.verifyLogin(loginController.text, passwordController.text);
    Navigator.pushNamed(context, '/refer-and-win', arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(30),
          children: [
            BoxText.body(
              'LOGIN',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            InfoTextFieldWidget(
              controller: loginController,
              label: 'Login:',
              hintText: 'Nome',
            ),
            const SizedBox(height: 5),
            InfoTextFieldWidget(
              controller: passwordController,
              label: 'Senha:',
              hintText: 'Senha',
            ),
            const SizedBox(height: 20),
            ButtonWidget(
              title: 'Entrar',
              onTap: _navigator,
            ),
          ],
        ),
      ),
    );
  }
}
