import 'package:e_log_social/app/modules/register/data/repository/register_repository.dart';
import 'package:e_log_social/app/modules/register/views/states/add-register/add_register_state.dart';
import 'package:e_log_social/app/modules/register/views/states/add-register/add_register_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerRepositoryProvider = Provider(
  (ref) => RegisterRepository(),
);

final addRegisterProvider =
    StateNotifierProvider<AddRegisterStateNotifier, AddRegisterState>(
  (ref) => AddRegisterStateNotifier(
    registerRepository: ref.read(registerRepositoryProvider),
  ),
);
