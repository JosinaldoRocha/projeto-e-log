import 'package:e_log_social/app/modules/widgets/button/button_widget.dart';
import 'package:e_log_social/app/modules/widgets/texts/box_text.dart';
import 'package:flutter/material.dart';

class IsNotSubscribed extends StatefulWidget {
  const IsNotSubscribed({super.key});

  @override
  State<IsNotSubscribed> createState() => _IsNotSubscribedState();
}

class _IsNotSubscribedState extends State<IsNotSubscribed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 23),
      child: Container(
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 79),
              Image.asset('assets/images/card.png'),
              const SizedBox(height: 54),
              BoxText.bodyBold(
                'Você ainda não está participando da nossa promoção!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              BoxText.body(
                'Inscreva-se e comece a ganhar dinheiro '
                'compartilhando o app com seus amigos.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 38),
              ButtonWidget(
                height: 60,
                width: 200,
                color: const Color.fromRGBO(0, 103, 35, 1),
                title: 'Participar',
                onTap: () async {
                  await Navigator.pushNamed(context, '/register-page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
