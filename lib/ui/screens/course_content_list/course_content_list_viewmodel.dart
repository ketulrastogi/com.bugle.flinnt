import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/enums/snackbar_type.dart';
import 'package:flinnt/models/course.dart';
import 'package:flinnt/models/course_content_list_reponse.dart';
import 'package:flinnt/models/course_section.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/services/course.dart';
import 'package:flinnt/services/local_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseContentListScreenViewModel extends BaseViewModel {
  final CourseService _courseService = locator<CourseService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final LocalDataService _localDataService = locator<LocalDataService>();

  String _contentCount = '0';
  String get contentCount => _contentCount;
  String _sectionCount = '0';
  String get sectionCount => _sectionCount;
  Map<String, dynamic> _service;
  Map<String, dynamic> get service => _service;
  String _hasMore = '0';
  String get hasMore => _hasMore;
  List<CourseSection> _sectionList = [];
  List<CourseSection> get sectionList => _sectionList;

  Future<void> getCourseContents(Course course) async {
    setBusy(true);
    try {
      String userId = await _localDataService.getUserId();
      ResponseData _responseData = await _courseService.getCourseContents(
          userId, course.id, '0', '100', '');

      print(
          "MyCourseContentListViewModel[37]- Response: ${_responseData.toJson()}");

      if (_responseData != null && _responseData.status == 1) {
        CourseContentListResponse _courseContentListResponse =
            CourseContentListResponse.fromJson(_responseData.data);

        _sectionCount = _courseContentListResponse.sectionCount;
        _contentCount = _courseContentListResponse.contentCount;
        _service = _courseContentListResponse.service;
        _hasMore = _courseContentListResponse.hasMore;
        _sectionList = _courseContentListResponse.sections;
        notifyListeners();
      } else {
        print(
            "MyCourseContentListViewModel[44]- Response: ${_responseData.toJson()}");
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: '${_responseData.message}',
        );
      }
    } catch (e) {
      print('MyCourseContentListViewModel[54]- : Error - ${e.toString()}');
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: '$e',
      );
    } finally {
      setBusy(false);
    }
  }
}
