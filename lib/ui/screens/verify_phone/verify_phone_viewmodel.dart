import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/enums/snackbar_type.dart';
import 'package:flinnt/models/account_verify_mobile_response.dart';
import 'package:flinnt/models/account_verify_status_response.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/services/auth.dart';
import 'package:flinnt/services/local_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyPhoneScreenViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final LocalDataService _localDataService = locator<LocalDataService>();

  String _verificationCode;
  String get verificationCode => _verificationCode;

  String _userLogin;
  String get userLogin => _userLogin;

  setVerificationCode(String value) {
    _verificationCode = value;
    notifyListeners();
  }

  setUserLogin() async {
    _userLogin = await _localDataService.getUserLogin();
    notifyListeners();
  }

  verifyPhoneNumber() async {
    setBusyForObject('VerifyCode', true);
    try {
      String userId = await _localDataService.getUserId();
      ResponseData _responseData =
          await _authService.accountVerifyMobile(userId, _verificationCode);
      if (_responseData != null && _responseData.status == 1) {
        AccountVerifyMobileResponse _accountVerifyMobileResponse =
            AccountVerifyMobileResponse.fromJson(_responseData.data);
        if (_accountVerifyMobileResponse.userAccountVerified == '1') {
          _navigationService.clearStackAndShow(Routes.homeScreenView);
        } else {
          _snackbarService.showCustomSnackBar(
            variant: SnackbarType.error,
            message: 'Account is not verified, try again.',
          );
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
      setBusyForObject('VerifyCode', false);
    }
  }

  verifyAccountStatus() async {
    setBusyForObject('VerifyStatus', true);
    try {
      String userId = await _localDataService.getUserId();
      ResponseData _responseData =
          await _authService.accountVerifyStatus(userId);
      if (_responseData != null && _responseData.status == 1) {
        AccountVerifyStatusResponse _accountVerifyStatusResponse =
            AccountVerifyStatusResponse.fromJson(_responseData.data);
        if (_accountVerifyStatusResponse.userAccountVerified == '1') {
          _navigationService.clearStackAndShow(Routes.homeScreenView);
        } else {
          _snackbarService.showCustomSnackBar(
            variant: SnackbarType.error,
            message: 'Account is not verified, try again.',
          );
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
      setBusyForObject('VerifyStatus', false);
    }
  }

  resendVerificationSMS() async {
    setBusyForObject('ResendSMS', true);
    try {
      String userId = await _localDataService.getUserId();
      await _authService.accountVerifyResend(userId);
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.success,
        message: 'Verification Code is sent via SMS.',
      );
    } catch (e) {
      print(e.toString());
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: '$e',
      );
    } finally {
      setBusyForObject('ResendSMS', false);
    }
  }

  logout() async {
    setBusyForObject('Logout', true);
    await _localDataService.deleteUserId();
    setBusyForObject('Logout', false);
    _navigationService.clearStackAndShow(Routes.loginScreenView);
  }
}
