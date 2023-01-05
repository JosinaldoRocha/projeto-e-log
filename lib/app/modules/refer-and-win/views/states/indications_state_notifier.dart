import 'package:e_log_social/app/modules/refer-and-win/data/repositoty/indications_repository.dart';
import 'package:e_log_social/app/modules/refer-and-win/views/states/indications_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndicationsStateNotifier extends StateNotifier<IndicationsState> {
  IndicationsStateNotifier({required this.indicationRepository})
      : super(InitialIndicationsState());

  final IndicationsRepository indicationRepository;

  void load() async {
    state = LoadingIndicationsState();

    try {
      final success = await indicationRepository.getAll();
      state = SuccessIndicationsState(listData: success);
    } catch (e) {
      state = FailureIndicationsState(errorMessage: 'Falha ao carregar dados');
    }
  }
}
