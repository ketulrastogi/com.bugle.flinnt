import 'package:shared_preferences/shared_preferences.dart';

class LocalDataService {
  saveUserId(String userId) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.setString('user_id', userId);
  }

  Future<String> getUserId() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    return _sharedPreferences.getString('user_id');
  }

  saveUserLogin(String userLogin) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.setString('user_login', userLogin);
  }

  Future<String> getUserLogin() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    return _sharedPreferences.getString('user_login');
  }

  deleteUserId() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.remove('user_id');
  }
}
