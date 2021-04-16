import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/services/local_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MainDrawerWidgetViewModel extends BaseViewModel {
  final LocalDataService _localDataService = locator<LocalDataService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _userId;
  String _userLogin;
  String _firstName;
  String _lastName;

  String get userId => _userId;
  String get userLogin => _userLogin;
  String get firstName => _firstName;
  String get lastName => _lastName;

  getUserDetails() async {
    _userId = await _localDataService.getUserId();
    _userLogin = await _localDataService.getUserLogin();
    _firstName = await _localDataService.getUserFirstName();
    _lastName = await _localDataService.getUserLastName();
    notifyListeners();
  }

  logout() async {
    setBusyForObject('Logout', true);
    await _localDataService.deleteUserId();
    setBusyForObject('Logout', true);
    _navigationService.clearStackAndShow(Routes.loginScreenView);
  }

  navigateToUserProfileScreen() {
    _navigationService.navigateTo(Routes.userProfileScreenView);
  }
}
