import '../../res/import/import.dart';

class TestProvider extends ChangeNotifier {
  static TestProvider? _instance;

  static late ApiService apiService;

  TestProvider() {
    apiService = ApiServiceImpl();
  }

  static TestProvider get instance {
    _instance ??= TestProvider();
    return _instance!;
  }
}
