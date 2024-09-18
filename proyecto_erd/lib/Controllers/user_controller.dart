import 'package:proyecto_erd/models/user.dart';

class UserController {
  bool login(String username, String password) {
    final Usuario admin = Usuario();

    if (username == admin.username && password == admin.password) {
      return true;
    } else {
      return false;
    }
  }
}
