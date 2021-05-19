import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flinnt/global/constants.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/utils/utilities.dart';

class UserService {
  Future<ResponseData> getAccountProfile(
    String userId,
  ) async {
    var response = await http.post(
      Uri.parse('$API_BASE_URL/$ACCOUNT_PROFILE_GET'),
      body: {
        "user_id": userId,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));
    return _responseData;
  }

  Future<ResponseData> updateAccountProfile(
    String userId,
    String firstName,
    String lastName,
    String instituteName,
    String gender,
    String dobDay,
    String dobMonth,
    String dobYear,
    String city,
    String email,
    String mobileNo,
    String resourceId,
  ) async {
    print('UserService[37]- UpdateProfileRequestBody: ${{
      "user_id": userId,
      'first_name': firstName,
      'last_name': lastName,
      'institute_name': instituteName,
      'gender': gender,
      'dob_day': dobDay,
      'dob_month': dobMonth,
      'dob_year': dobYear,
      'city': city,
      'email': email,
      'mobile_no': mobileNo,
      // 'resource_id': resourceId,
    }}');

    var response = await http.post(
      Uri.parse('$API_BASE_URL/$ACCOUNT_PROFILE_UPDATE'),
      body: {
        "user_id": userId,
        'first_name': firstName,
        'last_name': lastName,
        'institute_name': instituteName,
        'gender': gender,
        'dob_day': dobDay,
        'dob_month': dobMonth,
        'dob_year': dobYear,
        'city': city,
        'email': email,
        'mobile_no': mobileNo,
        // 'resource_id': resourceId,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));
    return _responseData;
  }
}
