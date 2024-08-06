import 'package:diox/diox.dart';

abstract class AuthService {
  Future<Response> login({required Map<String, dynamic> data});
  Future<Response> signup({required Map<String, dynamic> data});
  Future<Response> setTransactionPin({required Map<String, dynamic> data});
  Future<Response> forgotPassword({required Map<String, dynamic> data});
  Future<Response> resetPassword({required Map<String, dynamic> data});
  Future<Response> getAllOtp();
  Future<Response> verifyOtp({required Map<String, dynamic> data});
}
