import 'package:flinnt/global/constants.dart';
import 'package:flinnt/models/response_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CourseService {
  Future<ResponseData> getMyCourses(
    String userId,
    String offset,
    String max,
    String searchKeyword,
    // List<String> excludeCourseList,
  ) async {
    var response = await http.post(
      // Uri.parse('https://api.flinnt.com/mobile/v2.0/android/course/my/'),
      Uri.parse('$API_BASE_URL/$MY_COURSES'),
      body: {
        'user_id': userId,
        'offset': '0',
        'max': '100',
        // 'search': searchKeyword,
        // 'exclude_courses': excludeCourseList,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));
    return _responseData;
  }

  Future<ResponseData> getCourseContents(
    String userId,
    String courseId,
    String offset,
    String max,
    String searchKeyword,
  ) async {
    var response = await http.post(
      // Uri.parse('https://api.flinnt.com/mobile/v2.0/android/lms/list/'),
      Uri.parse('$API_BASE_URL/$COURSE_CONTENTS'),
      body: {
        'user_id': userId,
        'course_id': '42941',
        'offset': '0',
        'max': '100',
        // 'search': searchKeyword,
        // 'exclude_courses': excludeCourseList,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));
    return _responseData;
  }
}
