import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/enums/snackbar_type.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/models/sign_in_response.dart';
import 'package:flinnt/services/auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginScreenViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
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
        _navigationService.clearStackAndShow(Routes.homeScreenView);
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
}
