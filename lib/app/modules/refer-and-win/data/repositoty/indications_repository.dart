import 'package:e_log_social/app/modules/refer-and-win/data/models/indications_model.dart';

class IndicationsRepository {
  var indicationsList = [
    IndicationsModel(
      name: 'JoãozimDaElog',
      image: 'assets/images/person.png',
      day: '3d',
      id: 1,
      successIndications: false,
    ),
    IndicationsModel(
      name: 'JoãozimDaElog',
      image: 'assets/images/person.png',
      day: '3d',
      id: 1,
      successIndications: true,
    ),
    IndicationsModel(
      name: 'JoãozimDaElog',
      image: 'assets/images/person.png',
      day: '3d',
      id: 1,
      successIndications: true,
    ),
    IndicationsModel(
      name: 'JoãozimDaElog',
      image: 'assets/images/person.png',
      day: '3d',
      id: 1,
      successIndications: true,
    ),
  ];

  Future<List<IndicationsModel>> getAll() async {
    await Future.delayed(const Duration(seconds: 2));
    return indicationsList;
  }
}
