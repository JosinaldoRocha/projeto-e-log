import 'package:e_log_social/app/modules/register/data/models/register_model.dart';
import 'package:e_log_social/app/modules/register/data/repository/register_repository.dart';
import 'package:e_log_social/app/modules/register/views/states/add-register/add_register_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddRegisterStateNotifier extends StateNotifier<AddRegisterState> {
  AddRegisterStateNotifier({required this.registerRepository})
      : super(InitialAddRegisterState());
  final RegisterRepository registerRepository;

  void add(RegisterModel register) {
    state = LoadingAddRegisterState();

    try {
      state = SuccessAddRegisterState();
      registerRepository.addRegister(register);
    } catch (e) {
      state = FailureAddRegisterState(errorMessage: 'Erro ao carregar dados');
    }
  }

  void load() async {
    state = LoadingAddRegisterState();
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = SuccessAddRegisterState();
    } catch (e) {
      state = FailureAddRegisterState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
