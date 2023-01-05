import 'package:e_log_social/app/modules/widgets/button/button_widget.dart';
import 'package:e_log_social/app/modules/widgets/share-link-button/share_link_button_widget.dart';
import 'package:e_log_social/app/modules/widgets/texts/box_text.dart';
import 'package:flutter/material.dart';

class SuccessfulRegistrationPage extends StatelessWidget {
  const SuccessfulRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: BoxText.body(
          'Indique e ganhe',
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(0, 103, 35, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 23),
        child: Container(
          padding: const EdgeInsets.fromLTRB(
            20,
            53,
            20,
            0,
          ),
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: _buildContext(),
        ),
      ),
    );
  }

  Widget _buildContext() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 420),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoxText.bodyBold(
              'Cadastro completo ',
            ),
            const Icon(Icons.check),
          ],
        ),
        const SizedBox(height: 14),
        BoxText.body(
          'Agora é só compartilhar o link com seus amigos para começar a ganhar dinheiro.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 18),
        const ShareLinkButtonWidget(),
        const SizedBox(height: 18),
        ButtonWidget(
          width: 200,
          color: const Color.fromRGBO(0, 103, 35, 1),
          title: 'Compartilhar',
          onTap: () {},
        ),
      ],
    );
  }
}
