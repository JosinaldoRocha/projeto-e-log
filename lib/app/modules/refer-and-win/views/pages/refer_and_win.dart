import 'package:e_log_social/app/modules/login/data/login_model.dart';
import 'package:e_log_social/app/modules/refer-and-win/widgets/is_not_subscribed_widget.dart';
import 'package:e_log_social/app/modules/refer-and-win/widgets/is_subscribed_widget.dart';
import 'package:e_log_social/app/modules/widgets/texts/box_text.dart';
import 'package:flutter/material.dart';

class ReferAndWinPage extends StatefulWidget {
  const ReferAndWinPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReferAndWinPageState();
}

class _ReferAndWinPageState extends State<ReferAndWinPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as LoginModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: BoxText.body(
          'Indique e ganhe',
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(0, 103, 35, 1),
      ),
      body: (args.isLogged)
          ? const IsSubscribedWidget()
          : const IsNotSubscribed(),
    );
  }
}
