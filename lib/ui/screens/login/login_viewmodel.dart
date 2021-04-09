import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/enums/snackbar_type.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/models/sign_in_response.dart';
import 'package:flinnt/services/auth.dart';
import 'package:flinnt/services/local_data.dart';
import 'package:flinnt/utils/utilities.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginScreenViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final LocalDataService _localDataService = locator<LocalDataService>();
  String _username;
  String _password;

  String get username => _username;
  String get password => _password;

  setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  signIn() async {
    print('Username: $_username, Password: $_password');
    setBusy(true);
    try {
      ResponseData _responseData =
          await _authService.signIn(_username, _password);
      if (_responseData != null && _responseData.status == 1) {
        SignInResponse _signInResponse =
            SignInResponse.fromJson(_responseData.data);

        await _localDataService.saveUserId(_signInResponse.userId);
        await _localDataService.saveUserLogin(_signInResponse.userLogin);
        if (_signInResponse.userAccountVerified == '1') {
          _navigationService.clearStackAndShow(Routes.homeScreenView);
        } else {
          if (isNumber(_username)) {
            _navigationService.clearStackAndShow(Routes.verifyPhoneScreenView);
          } else {
            _navigationService.clearStackAndShow(Routes.verifyEmailScreenView);
          }
        }
      } else {
        print("Response: ${_responseData.toJson()}");
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: '${_responseData.message}',
        );
      }
    } catch (e) {
      print(e.toString());
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: '$e',
      );
    } finally {
      setBusy(false);
    }
  }

  navigateToRegisterScreen() {
    _navigationService.navigateTo(Routes.registerScreenView);
  }

  navigateToForgotPasswordScreen() {
    _navigationService.navigateTo(Routes.forgotPasswordScreenView);
  }
}
