import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/enums/snackbar_type.dart';
import 'package:flinnt/models/course.dart';
import 'package:flinnt/models/institute.dart';
import 'package:flinnt/models/institute_course_list_response.dart';
import 'package:flinnt/models/institute_list_response.dart';
import 'package:flinnt/models/my_course_list_response.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/services/course.dart';
import 'package:flinnt/services/institute.dart';
import 'package:flinnt/services/local_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InstituteDetailScreenViewModel extends BaseViewModel {
  final CourseService _courseService = locator<CourseService>();
  final InstituteService _instituteService = locator<InstituteService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final LocalDataService _localDataService = locator<LocalDataService>();

  List<Course> _courseList = [];
  List<Course> get courseList => _courseList;

  Future<void> getInstituteCourseList(Institute institute) async {
    setBusy(true);
    // await Future.delayed(Duration(seconds: 2));
    try {
      String userId = await _localDataService.getUserId();
      ResponseData _responseData = await _instituteService.getInstituteCourses(
          userId, institute.id, '0', '100');
      print(
          "InstituteDetailScreenViewModel[28]- Response: ${_responseData.toJson()}");
      if (_responseData != null && _responseData.status == 1) {
        InstituteCourseListResponse _instituteCourseListResponse =
            InstituteCourseListResponse.fromJson(_responseData.data);
        _courseList = _instituteCourseListResponse.courseList
            .map((course) => course.copyWith(
                  picture:
                      '${_instituteCourseListResponse.coursePictureUrl}${course.picture}',
                  userPicture:
                      '${_instituteCourseListResponse.userPictureUrl}${course.userPicture}',
                ))
            .toList();
        setBusy(false);
        notifyListeners();
      } else {
        print(
            "InstituteDetailScreenViewModel[44]- Response: ${_responseData.toJson()}");
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: '${_responseData.message}',
        );
      }
    } catch (e) {
      print('InstituteDetailScreenViewModel[52]- : Error - ${e.toString()}');
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: '$e',
      );
    } finally {
      setBusy(false);
    }
  }
}
