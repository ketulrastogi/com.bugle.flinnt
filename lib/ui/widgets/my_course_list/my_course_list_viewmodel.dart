import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/enums/snackbar_type.dart';
import 'package:flinnt/models/course.dart';
import 'package:flinnt/models/my_course_list_response.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/services/course.dart';
import 'package:flinnt/services/local_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyCourseListWidgetViewModel extends BaseViewModel {
  final CourseService _courseService = locator<CourseService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final LocalDataService _localDataService = locator<LocalDataService>();

  List<Course> _courseList = [];
  List<Course> get courseList => _courseList;
  String _errorMessage;

  Future<MyCourseListResponse> getMyCourse() async {
    setBusy(true);
    try {
      String userId = await _localDataService.getUserId();
      ResponseData _responseData =
          await _courseService.getMyCourses(userId, '0', '10', '');

      if (_responseData != null && _responseData.status == 1) {
        MyCourseListResponse _myCourseListResponse =
            MyCourseListResponse.fromJson(_responseData.data);
        return _myCourseListResponse;
      } else {
        print("Response: ${_responseData.toJson()}");
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: '${_responseData.message}',
        );
        return null;
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
    return null;
  }

  Future<void> getMyCourseDemo() async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 2));
    try {
      String userId = await _localDataService.getUserId();

      _courseList = List.generate(
          10,
          (index) => Course.fromJson({
                "course_id": "42941",
                "course_name": "ધોરણ 6 સામાજિક વિજ્ઞાન for Ideal",
                "course_picture":
                    "https://flinnt.s3.amazonaws.com/courses/default.png",
                "user_picture":
                    "https://flinnt.s3.amazonaws.com/profile_image/831838_1615201775.jpg",
                "course_price": "0",
                "course_owner_name": "IDeAL Innovative Teachers",
                "course_is_free": "1",
                "course_status": "2",
                "user_mod_role_id": "2",
                "course_user_picture":
                    "https://flinnt.s3.amazonaws.com/profile_image/courses/831838_42941_1616562780.jpg",
                "course_plan_expired": "0",
                "stat_total_posts": "0",
                "stat_total_view": "0",
                "course_community": "0",
                "total_users": "0",
                "public_type": "0",
                "event_datetime": "",
                "user_school_name": "EdXL Programme",
                "unread_post": "0",
                "allow_mute": "1",
                "allow_invite_users": "1",
                "allow_change_settings": "0",
                "allow_rate_course": "0",
                "allow_unsubscribe": "0",
                "allowed_roles": "3",
                "allow_course_info": "1"
              }));
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
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
