import 'package:e_log_social/app/modules/register/data/models/register_model.dart';
import 'package:e_log_social/app/modules/register/data/repository/register_repository.dart';
import 'package:e_log_social/app/modules/register/dependencies/dependencies.dart';
import 'package:e_log_social/app/modules/register/views/states/add-register/add_register_state.dart';
import 'package:e_log_social/app/modules/widgets/texts/text_widget.dart';
import 'package:e_log_social/app/modules/widgets/button/button_widget.dart';
import 'package:e_log_social/app/modules/widgets/texts/box_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _phoneController = TextEditingController();
  final registerRepository = RegisterRepository();

  void _listen() {
    final register = RegisterModel(
      name: _nameController.text,
      cpf: _cpfController.text,
      phone: _phoneController.text,
    );
    ref.listen<AddRegisterState>(addRegisterProvider, (previous, next) {
      if (next is SuccessAddRegisterState) {
        registerRepository.addRegister(register);
      } else if (next is FailureAddRegisterState) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('ERRO:'),
            content: Text(next.errorMessage),
          ),
        );
      } else {
        Container();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(addRegisterProvider.notifier).load(),
    );
  }

  @override
  Widget build(BuildContext context) {
    _listen();
    final addRegisterState = ref.watch(addRegisterProvider);
    return Scaffold(
      appBar: AppBar(
        title: BoxText.body(
          'Cadastre-se',
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 103, 35, 1),
      ),
      body: (addRegisterState is LoadingAddRegisterState)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 23),
              child: Container(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  53,
                  20,
                  0,
                ),
                color: const Color.fromRGBO(255, 255, 255, 1),
                child: _buildListViewContext(),
              ),
            ),
    );
  }

  Widget _buildListViewContext() {
    return Flexible(
      child: ListView(
        children: [
          BoxText.body(
            'Precisamos de alguns dados para finalizarmos o cadastro.',
          ),
          const SizedBox(height: 34),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: 'Nome completo'),
          ),
          const SizedBox(height: 34),
          TextField(
            controller: _cpfController,
            decoration: const InputDecoration(
              hintText: '000.000.000-00',
              labelText: 'CPF',
              counterText:
                  'Utilizaremos seu CPF para fazer o PIX dos valores que você receber.',
            ),
          ),
          const SizedBox(height: 34),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              hintText: '(00) 00000-0000',
              labelText: 'Telefone',
            ),
          ),
          const SizedBox(
            height: 170,
          ),
          const TextWidget(
              title: 'Ao clicar em cadastrar, você confirma que está de'),
          _buildTextRow(),
          const TextWidget(title: 'nossa promoção.'),
          const SizedBox(height: 19),
          ButtonWidget(
            title: 'Cadastrar',
            onTap: () {
              Navigator.pushNamed(context, '/successful-registration');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextRow() {
    return Row(
      children: [
        const TextWidget(title: 'acordo com as '),
        GestureDetector(
          onTap: () {},
          child: const TextWidget(
            title: 'regras ',
            color: Colors.blue,
          ),
        ),
        const TextWidget(title: 'e '),
        GestureDetector(
          onTap: () {},
          child: const TextWidget(
            title: 'politicas de privacidade ',
            color: Colors.blue,
          ),
        ),
        const TextWidget(title: 'da'),
      ],
    );
  }
}
