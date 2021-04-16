import 'package:stacked/stacked.dart';

class UserProfileScreenViewModel extends BaseViewModel {
  String _firstName;
  String _lastName;
  String _instituteName;
  String _gender;
  DateTime _birthdate;
  String _city;
  String _email;
  String _mobile;

  String _currentPassword;
  String _newPassword;
  String _newPasswordConfirm;

  setUserFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  setUserLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  setUserInstituteName(String value) {
    _instituteName = value;
    notifyListeners();
  }

  setUserGender(String value) {
    _gender = value;
    notifyListeners();
  }

  setUserBirthdate(DateTime value) {
    _birthdate = value;
    notifyListeners();
  }

  setUserCity(String value) {
    _city = value;
    notifyListeners();
  }

  setUserEmail(String value) {
    _email = value;
    notifyListeners();
  }

  setUserMobile(String value) {
    _mobile = value;
    notifyListeners();
  }

  setUserCurrentPassword(String value) {
    _currentPassword = value;
    notifyListeners();
  }

  setUserNewPassword(String value) {
    _newPassword = value;
    notifyListeners();
  }

  setUserNewPasswordConfirm(String value) {
    _newPasswordConfirm = value;
    notifyListeners();
  }
}
