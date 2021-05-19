import 'package:flinnt/global/constants.dart';
import 'package:flinnt/models/response_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InstituteService {
  Future<ResponseData> getInstituteList(
    String userId,
    String offset,
    String max,
    String searchKeyword,
    // List<String> excludeCourseList,
  ) async {
    print('UserId: $userId');
    var response = await http.post(
      Uri.parse('$API_BASE_URL/$INSTITUTE_LIST'),
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

  Future<ResponseData> getInstituteCourses(
    String userId,
    String instituteId,
    String offset,
    String max,
    // List<String> excludeCourseList,
  ) async {
    print('UserId: $userId');
    var response = await http.post(
      // Uri.parse('https://api.flinnt.com/mobile/v2.0/android/course/my/'),

      Uri.parse('$API_BASE_URL/$INSTITUTE_COURSE_LIST'),
      body: {
        'user_id': userId,
        'institute_id': instituteId,
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

  Future<ResponseData> sendRequestToJoinInstituteCourse(
    String userId,
    String courseId,
  ) async {
    print('UserId: $userId');
    var response = await http.post(
      Uri.parse('$API_BASE_URL/$REQUEST_TO_JOIN_INSTITUTE_COURSE'),
      body: {
        'user_id': userId,
        'course_id': courseId,
        'notes': '[]'
        // 'search': searchKeyword,
        // 'exclude_courses': excludeCourseList,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));
    return _responseData;
  }

  courseViewAlsoJoined(
    String userId,
    String courseId,
    String max,
  ) async {
    print('UserId: $userId');
    var response = await http.post(
      Uri.parse('$API_BASE_URL/$COURSE_VIEW_ALSO_JOINED'),
      body: {
        'user_id': userId,
        'course_id': courseId,
        'max': max ?? 10
        // 'search': searchKeyword,
        // 'exclude_courses': excludeCourseList,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));
    return _responseData;
  }
}
