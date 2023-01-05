import 'package:e_log_social/app/modules/widgets/button/button_widget.dart';
import 'package:e_log_social/app/modules/widgets/share-link-button/share_link_button_widget.dart';
import 'package:e_log_social/app/modules/widgets/texts/box_text.dart';
import 'package:e_log_social/app/modules/widgets/texts/text_widget.dart';
import 'package:flutter/material.dart';

class ContextShareLinkWidget extends StatelessWidget {
  const ContextShareLinkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 1),
      width: 390,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          BoxText.bodyBold(
            'Compatilhe seu link',
          ),
          const SizedBox(height: 14),
          BoxText.body(
            'Compartilhe seu link e ganhe ',
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                title: 'R\$ 5 ',
                size: 20,
                color: Colors.amber,
              ),
              BoxText.body('por indicação.'),
            ],
          ),
          const SizedBox(height: 13),
          const ShareLinkButtonWidget(),
          const SizedBox(height: 13),
          ButtonWidget(
            width: 200,
            height: 60,
            color: const Color.fromRGBO(0, 103, 35, 1),
            title: 'Compartilhar',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
