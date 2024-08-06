import 'package:danapp/data/remote/auth/auth_service.dart';
import 'package:danapp/repository/authentication/authentication_http_service.dart';

import '../../res/import/import.dart';

class AuthenticationProvider extends ChangeNotifier {
  static AuthenticationProvider? _instance;
  static late ApiService apiService;
  static late AuthService service;

  AuthenticationProvider() {
    service = AuthHttpService();
    apiService = ApiServiceImpl();
  }

  static AuthenticationProvider get instance {
    _instance ??= AuthenticationProvider();
    return _instance!;
  }

  String _customerType = 'customer';

  String get customerType => _customerType;

  set customerType(String value) {
    _customerType = value;
    notifyListeners();
  }
}
