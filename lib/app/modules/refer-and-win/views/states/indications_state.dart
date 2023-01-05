import 'package:e_log_social/app/modules/refer-and-win/data/models/indications_model.dart';

abstract class IndicationsState {}

class InitialIndicationsState implements IndicationsState {}

class LoadingIndicationsState implements IndicationsState {}

class SuccessIndicationsState implements IndicationsState {
  SuccessIndicationsState({required this.listData});
  final List<IndicationsModel> listData;
}

class FailureIndicationsState implements IndicationsState {
  FailureIndicationsState({required this.errorMessage});
  final String errorMessage;
}
