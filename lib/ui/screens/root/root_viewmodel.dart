import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/models/auto_login_response.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/services/auth.dart';
import 'package:flinnt/services/local_data.dart';
import 'package:flinnt/utils/utilities.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RootScreenViewModel extends BaseViewModel {
  final LocalDataService _localDataService = locator<LocalDataService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  authenticateUser() async {
    // await Future.delayed(Duration(seconds: 2));
    String userId = await _localDataService.getUserId();
    print('UserId: $userId');
    if (userId != null && userId != '') {
      ResponseData _responseData = await _authService.autoLogin(userId);

      if (_responseData != null && _responseData.status == 1) {
        AutoLoginResponse _autoLoginResponse =
            AutoLoginResponse.fromJson(_responseData.data);

        await _localDataService.saveUserId(_autoLoginResponse.userId);
        await _localDataService.saveUserLogin(_autoLoginResponse.userLogin);
        await _localDataService.saveUserFirstName(_autoLoginResponse.firstName);
        await _localDataService.saveUserLastName(_autoLoginResponse.lastName);

        if (_autoLoginResponse.userAccountVerified == '1') {
          _navigationService.clearStackAndShow(Routes.homeScreenView);
        } else {
          if (isNumber(_autoLoginResponse.userLogin)) {
            _navigationService.clearStackAndShow(Routes.verifyPhoneScreenView);
          } else {
            _navigationService.clearStackAndShow(Routes.verifyEmailScreenView);
          }
        }
      } else {
        _navigationService.clearStackAndShow(Routes.loginScreenView);
      }
    } else {
      _navigationService.clearStackAndShow(Routes.loginScreenView);
    }
  }
}
