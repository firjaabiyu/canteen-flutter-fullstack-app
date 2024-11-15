
import 'package:shared_preferences/shared_preferences.dart';
import 'package:canteen_app/data/model/response/auth_response_model.dart';

class AuthLocalDatasource {
  Future<void> saveAuthData(AuthResponseModel authResponModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authData', authResponModel.toJson());
  }

  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authData');
  }

  Future<AuthResponseModel?> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('authData');
    return AuthResponseModel.fromJson(authData!);
  }

  Future<bool> isAuthDataExists() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('authData');
    return authData != null;
  }
}