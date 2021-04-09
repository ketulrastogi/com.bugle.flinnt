import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flinnt/global/constants.dart';
import 'package:flinnt/models/account_verify_mobile_response.dart';
import 'package:flinnt/models/account_verify_resend_response.dart';
import 'package:flinnt/models/account_verify_status_response.dart';
import 'package:flinnt/models/forgot_password_response.dart';
import 'package:flinnt/models/sign_in_response.dart';
import 'package:flinnt/models/response_data.dart';
import 'package:flinnt/models/sign_up_response.dart';
import 'package:flinnt/utils/utilities.dart';

class AuthService {
  Future<ResponseData> signIn(
    String username,
    String password,
  ) async {
    String _passwordHash = convertPasswordToMD5(password);
    var response = await http.post(
      Uri.parse('$API_BASE_URL/$SIGN_IN'),
      body: {
        'username': username,
        'password': _passwordHash,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));
    return _responseData;
  }

  Future<ResponseData> autoLogin(
    String userId,
  ) async {
    var response = await http.post(
      Uri.parse('$API_BASE_URL/$AUTO_LOGIN'),
      body: {
        'user_id': userId,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));
    return _responseData;
  }

  Future<ResponseData> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    var response = await http.post(
      Uri.parse('$API_BASE_URL/$SIGN_UP'),
      body: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'pwd': password,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));
    return _responseData;
  }

  Future<ResponseData> forgotPassword(
    String username,
  ) async {
    var response = await http.post(
      Uri.parse('$API_BASE_URL/$FORGOT_PASSWORD'),
      body: {
        'username': username,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));

    return _responseData;
  }

  Future<ResponseData> accountVerifyMobile(
    String userId,
    String verificationCode,
  ) async {
    print('UserId: $userId, VerificationId: $verificationCode');
    var response = await http.post(
      Uri.parse('$API_BASE_URL/$ACCOUNT_VERIFY_MOBILE'),
      body: {
        'user_id': userId,
        'verification_code': verificationCode,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));

    return _responseData;
  }

  Future<ResponseData> accountVerifyResend(
    String userId,
  ) async {
    var response = await http.post(
      Uri.parse('$API_BASE_URL/$ACCOUNT_VERIFY_RESEND'),
      body: {
        'user_id': userId,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));

    return _responseData;
  }

  Future<ResponseData> accountVerifyStatus(
    String userId,
  ) async {
    var response = await http.post(
      Uri.parse('$API_BASE_URL/$ACCOUNT_VERIFY_STATUS'),
      body: {
        'user_id': userId,
      },
    );
    ResponseData _responseData =
        ResponseData.fromJson(jsonDecode(response.body));

    return _responseData;
  }
}
