import 'package:e_log_social/app/modules/register/data/models/register_model.dart';

class RegisterRepository {
  List<RegisterModel> registrationList = [];

  Future<List<RegisterModel>> getAll() async {
    Future.delayed(const Duration(seconds: 2));
    return registrationList;
  }

  void addRegister(RegisterModel item) {
    registrationList.add(item);
  }
}
