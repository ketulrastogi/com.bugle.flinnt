import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DemoScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  navigateToLoginScreen() {
    _navigationService.navigateTo(Routes.loginScreenView);
  }

  navigateToRegisterScreen() {
    _navigationService.navigateTo(Routes.registerScreenView);
  }

  navigateToForgotPasswordScreen() {
    _navigationService.navigateTo(Routes.forgotPasswordScreenView);
  }

  navigateToVerifyEmailScreen() {
    _navigationService.navigateTo(Routes.verifyEmailScreenView);
  }

  navigateToVerifyPhoneScreen() {
    _navigationService.navigateTo(Routes.verifyPhoneScreenView);
  }

  navigateToHomeScreen() {
    _navigationService.navigateTo(Routes.homeScreenView);
  }
}
