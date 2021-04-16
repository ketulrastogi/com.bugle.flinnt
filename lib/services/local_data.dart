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

  saveUserFirstName(String firstName) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.setString('first_name', firstName);
  }

  Future<String> getUserFirstName() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    return _sharedPreferences.getString('first_name');
  }

  saveUserLastName(String lastName) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.setString('last_name', lastName);
  }

  Future<String> getUserLastName() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    return _sharedPreferences.getString('last_name');
  }

  deleteUserId() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    _sharedPreferences.remove('user_id');
    _sharedPreferences.remove('user_login');
    _sharedPreferences.remove('first_name');
    _sharedPreferences.remove('last_name');
  }
}
