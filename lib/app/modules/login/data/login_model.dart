class LoginModel {
  String login = 'a';
  String password = 'aa';
  bool isLogged = false;

  void verifyLogin(String newLogin, String newPassword) {
    if (newLogin == login && newPassword == password) {
      isLogged = true;
    } else {
      isLogged = false;
    }
  }
}
