import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/enums/snackbar_type.dart';
import 'package:flinnt/models/account_profile_get_response.dart';
import 'package:flinnt/models/account_profile_update_response.dart';
import 'package:flinnt/models/mandatory_field.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/models/user_profile.dart';
import 'package:flinnt/services/local_data.dart';
import 'package:flinnt/services/user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserProfileScreenViewModel extends BaseViewModel {
  final LocalDataService _localDataService = locator<LocalDataService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
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

  UserProfile _userProfile;
  MandatoryField _mandatoryField;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get instituteName => _instituteName;
  String get gender => _gender;
  DateTime get birthDate => _birthdate;
  String get city => _city;
  String get email => _email;
  String get mobile => _mobile;

  String get currentPassword => _currentPassword;
  String get newPassword => _newPassword;
  String get newPasswordconfirm => _newPasswordConfirm;

  String _userLogin;
  String get userLogin => _userLogin;

  UserProfile get userProfile => _userProfile;
  MandatoryField get mandatoryField => _mandatoryField;

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
    print('Birthdate: $value');
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

  loadUserData() async {
    await getUserAccountProfile();
    _userLogin = await _localDataService.getUserLogin();
    notifyListeners();
  }

  getUserAccountProfile() async {
    setBusy(true);
    try {
      String userId = await _localDataService.getUserId();
      ResponseData _responseData = await _userService.getAccountProfile(userId);
      if (_responseData != null && _responseData.status == 1) {
        print(
            'UserProfileViewMode[110]- UserProfileResponse: ${_responseData.data}');
        AccountProfileGetResponse _accountProfileGetResponse =
            AccountProfileGetResponse.fromJson(_responseData.data);
        _userProfile = _accountProfileGetResponse.profileList[0];
        _mandatoryField = _accountProfileGetResponse.mandatory;
        notifyListeners();
      } else {
        print('UserProfleViewModel[116] - ${_responseData.message}');
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: '${_responseData.message}',
        );
      }
    } catch (e) {
      print('UserProfleViewModel[123] - $e');
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: '$e',
      );
    } finally {
      setBusy(false);
    }
  }

  updateUserAccountProfile() async {
    setBusy(true);
    try {
      String userId = await _localDataService.getUserId();
      String resourceId = '';
      ResponseData _responseData = await _userService.updateAccountProfile(
        userId,
        firstName,
        lastName,
        instituteName,
        gender,
        _birthdate.day.toString(),
        _birthdate.month.toString(),
        _birthdate.year.toString(),
        city,
        email,
        _mobile,
        resourceId,
      );
      if (_responseData != null && _responseData.status == 1) {
        print(
            'UserProfileViewMode[143]- UserProfileResponse: ${_responseData.data}');
        AccountProfileUpdateResponse _accountProfileUpdateResponse =
            AccountProfileUpdateResponse.fromJson(_responseData.data);
        print(
            'UserProfileViewModel[160]- UserProfileUpdated: ${_accountProfileUpdateResponse.updated}');

        if (_accountProfileUpdateResponse.accountProfileEmail.verifyEmail ==
            1) {
          _navigationService.clearStackAndShow(Routes.verifyEmailScreenView);
        }

        if (_accountProfileUpdateResponse.accountProfileMobile.verifyMobile ==
            1) {
          _navigationService.clearStackAndShow(Routes.verifyPhoneScreenView);
        }

        _navigationService.clearStackAndShow(Routes.homeScreenView);

        notifyListeners();
      } else {
        print('UserProfleViewModel[150] - ${_responseData.message}');
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: '${_responseData.message}',
        );
      }
    } catch (e) {
      print('UserProfleViewModel[157] - $e');
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: '$e',
      );
    } finally {
      setBusy(false);
    }
  }
}
