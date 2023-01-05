import 'package:e_log_social/app/modules/refer-and-win/data/repositoty/indications_repository.dart';
import 'package:e_log_social/app/modules/refer-and-win/views/states/indications_state.dart';
import 'package:e_log_social/app/modules/refer-and-win/views/states/indications_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indicationsRepositoryProvider = Provider(
  (ref) => IndicationsRepository(),
);

final indicationsState =
    StateNotifierProvider<IndicationsStateNotifier, IndicationsState>(
  (ref) => IndicationsStateNotifier(
    indicationRepository: ref.read(indicationsRepositoryProvider),
  ),
);
