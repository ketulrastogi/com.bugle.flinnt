import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/models/institute.dart';
import 'package:flinnt/models/institute_list_response.dart';
import 'package:flinnt/services/institute.dart';
import 'package:stacked/stacked.dart';
import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/enums/snackbar_type.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/services/local_data.dart';

class InstituteListScreenViewModel extends BaseViewModel {
  final InstituteService _instituteService = locator<InstituteService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final LocalDataService _localDataService = locator<LocalDataService>();

  List<Institute> _instituteList = [];

  List<Institute> get instituteList => _instituteList;

  getInstituteList() async {
    setBusy(true);
    // await Future.delayed(Duration(seconds: 2));
    try {
      String userId = await _localDataService.getUserId();
      ResponseData _responseData =
          await _instituteService.getInstituteList(userId, '0', '100', '');
      print("InstituteListViewModel[28]- Response: ${_responseData.toJson()}");
      if (_responseData != null && _responseData.status == 1) {
        InstituteListResponse _instituteListResponse =
            InstituteListResponse.fromJson(_responseData.data);
        _instituteList = _instituteListResponse.instituteList
            .map((institute) => institute.copyWith(
                  userPicture:
                      '${_instituteListResponse.userPictureUrl}${institute.userPicture}',
                ))
            .toList();

        notifyListeners();
      } else {
        print(
            "InstituteListViewModel[44]- Response: ${_responseData.toJson()}");
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: '${_responseData.message}',
        );
      }
      setBusy(false);
    } catch (e) {
      print('InstituteListViewModel[52]- : Error - ${e.toString()}');
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: '$e',
      );
    } finally {
      setBusy(false);
    }
  }

  navigateToInstituteDetailsScreen(Institute institute) {
    _navigationService.navigateTo(
      Routes.instituteDetailScreenView,
      arguments: InstituteDetailScreenViewArguments(institute: institute),
    );
  }
}
