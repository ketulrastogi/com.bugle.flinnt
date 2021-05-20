import 'package:flinnt/models/course_content_detail_response.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:flinnt/app/app.locator.dart';
import 'package:flinnt/services/course.dart';
import 'package:flinnt/services/local_data.dart';

import '../../../enums/snackbar_type.dart';
import '../../../models/course.dart';
import '../../../models/response_data.dart';

class CourseContentDetailScreenViewModel extends BaseViewModel {
  final CourseService _courseService = locator<CourseService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final LocalDataService _localDataService = locator<LocalDataService>();

  YoutubePlayerController _controller;
  YoutubePlayerController get controller => _controller;

  int _allowComment;
  int _approveComment;
  String _videoPreviewUrl;
  String _attachmentUrl;
  Map<String, dynamic> _thirdParty;
  CourseContent _content;

  int get allowCommet => _allowComment;
  int get approveComment => _approveComment;
  String get videoPreviewUrl => _videoPreviewUrl;
  String get attachmentUrl => _attachmentUrl;
  Map<String, dynamic> get thirdParty => _thirdParty;
  CourseContent get content => _content;

  loadData(Course course, String videoId, String contentId) async {
    await getCourseContentDetail(course, contentId);
    await setYoutubePlayerController(videoId);
    notifyListeners();
  }

  getCourseContentDetail(
    Course course,
    String contentId,
  ) async {
    setBusy(true);
    try {
      String userId = await _localDataService.getUserId();
      ResponseData _responseData = await _courseService.getCourseContentDetail(
          userId, course.id, contentId, '0', '100', '');

      print(
          "CourseContentDetailScreenViewModel[37]- Response: ${_responseData.toJson()}");

      if (_responseData != null && _responseData.status == 1) {
        CourseContentDetailResponse _courseContentListResponse =
            CourseContentDetailResponse.fromJson(_responseData.data);

        _allowComment = _courseContentListResponse.allowComment;
        _approveComment = _courseContentListResponse.approveComment;
        _videoPreviewUrl = _courseContentListResponse.videoPreviewUrl;
        _attachmentUrl = _courseContentListResponse.attachmentUrl;
        _thirdParty = _courseContentListResponse.thirdParty;
        _content = _courseContentListResponse.content;
        notifyListeners();
      } else {
        print(
            "CourseContentDetailScreenViewModel[44]- Response: ${_responseData.toJson()}");
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: '${_responseData.message}',
        );
      }
    } catch (e) {
      print(
          'CourseContentDetailScreenViewModel[54]- : Error - ${e.toString()}');
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: '$e',
      );
    } finally {
      setBusy(false);
    }
  }

  setYoutubePlayerController(String videoId) {
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        autoPlay: false,
      ),
    );
  }
}
