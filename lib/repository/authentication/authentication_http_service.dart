import '../../data/remote/auth/auth_service.dart';
import '../../data/remote/base_http.dart';
import '../../res/import/import.dart';

class AuthHttpService extends AlsBaseHttpService implements AuthService {
  @override
  Future<Response> login({required Map<String, dynamic> data}) async {
    try {
      final res = await http.post(ApiRoutes.login, data: data);
      return res;
    } on DioError {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Response> signup({required Map<String, dynamic> data}) async {
    try {
      final res = await http.post(ApiRoutes.signup, data: data);
      return res;
    } on DioError {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Response> setTransactionPin({required Map<String, dynamic> data}) async {
    try {
      final res = await http.post(ApiRoutes.setTransactionPin, data: data);
      return res;
    } on DioError {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Response> forgotPassword({required Map<String, dynamic> data}) async {
    try {
      final res = await http.post(ApiRoutes.forgetPassword, data: data);
      return res;
    } on DioError {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Response> resetPassword({required Map<String, dynamic> data}) async {
    try {
      final res = await http.post(ApiRoutes.resetPassword, data: data);
      return res;
    } on DioError {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Response> getAllOtp() async {
    try {
      final res = await http.get(ApiRoutes.getAllOtp);
      return res;
    } on DioError {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Response> verifyOtp({required Map<String, dynamic> data}) async {
    try {
      final res = await http.post(ApiRoutes.verifyOtp,data: data);
      return res;
    } on DioError {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

}
