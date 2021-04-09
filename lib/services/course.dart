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
      Uri.parse('https://api.flinnt.com/mobile/v2.0/android/course/my/'),
      // Uri.parse('$API_BASE_URL/$MY_COURSES'),
      body: {
        'user_id': userId,
        'offset': offset,
        'max': max,
        'search': searchKeyword,
        // 'exclude_courses': excludeCourseList,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));
    return _responseData;
  }
}
