import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/enums/snackbar_type.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/services/auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterScreenViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  String _firstname;
  String _lastname;
  String _email;
  String _password;

  String get firstname => _firstname;
  String get lastname => _lastname;
  String get email => _email;
  String get password => _password;

  setFirstname(String value) {
    _firstname = value;
    notifyListeners();
  }

  setLastname(String value) {
    _lastname = value;
    notifyListeners();
  }

  setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  signUp() async {
    setBusy(true);
    try {
      ResponseData _responseData = await _authService.signUp(
        _firstname,
        _lastname,
        _email,
        _password,
      );
      print('ResponseData: ${_responseData.toJson()}');
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
