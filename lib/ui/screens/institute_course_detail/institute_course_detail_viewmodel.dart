import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/app/app.router.dart';
import 'package:flinnt/enums/snackbar_type.dart';
import 'package:flinnt/models/course.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/services/course.dart';
import 'package:flinnt/services/institute.dart';
import 'package:flinnt/services/local_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InstituteCourseDetailScreenViewModel extends BaseViewModel {
  final CourseService _courseService = locator<CourseService>();
  final InstituteService _instituteService = locator<InstituteService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final DialogService _dialogService = locator<DialogService>();
  final LocalDataService _localDataService = locator<LocalDataService>();

  sendRequestToJoinCourse(Course course) async {
    setBusyForObject('SendRequestToJoinCourse', true);
    // await Future.delayed(Duration(seconds: 2));
    try {
      String userId = await _localDataService.getUserId();
      ResponseData _responseData = await _instituteService
          .sendRequestToJoinInstituteCourse(userId, course.id);
      print(
          "InstituteDetailScreenViewModel[28]- Response: ${_responseData.toJson()}");
      if (_responseData != null &&
          _responseData.status == 1 &&
          _responseData.data['sent'] == '1') {
        _dialogService
            .showConfirmationDialog(
              title: 'Success',
              description: 'Request to join this course is sent succesfully.',
              confirmationTitle: 'OK',
              barrierDismissible: true,
              cancelTitle: '',
            )
            .then((value) => _navigationService.clearStackAndShow(
                  Routes.homeScreenView,
                  arguments: HomeScreenViewArguments(index: 1),
                ));

        notifyListeners();
      } else {
        print(
            "InstituteDetailScreenViewModel[44]- Response: ${_responseData.toJson()}");
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: '${_responseData.message}',
        );
      }
      setBusyForObject('SendRequestToJoinCourse', false);
    } catch (e) {
      print('InstituteDetailScreenViewModel[52]- : Error - ${e.toString()}');
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: '$e',
      );
    } finally {
      setBusyForObject('SendRequestToJoinCourse', false);
    }
  }
}
