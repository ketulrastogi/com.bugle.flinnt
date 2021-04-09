import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/services/local_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MainDrawerWidgetViewModel extends BaseViewModel {
  final LocalDataService _localDataService = locator<LocalDataService>();
  final NavigationService _navigationService = locator<NavigationService>();

  logout() async {
    setBusyForObject('Logout', true);
    await _localDataService.deleteUserId();
    setBusyForObject('Logout', true);
    _navigationService.clearStackAndShow(Routes.loginScreenView);
  }
}
