// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/course.dart';
import '../ui/screens/course_content_detail/course_content_detail_view.dart';
import '../ui/screens/course_content_list/course_content_list_view.dart';
import '../ui/screens/demo/demo_view.dart';
import '../ui/screens/forgot_password/forgot_password_view.dart';
import '../ui/screens/home/home_view.dart';
import '../ui/screens/login/login_view.dart';
import '../ui/screens/register/register_view.dart';
import '../ui/screens/root/root_view.dart';
import '../ui/screens/user_profile/user_profile_view.dart';
import '../ui/screens/verify_email/verify_email_view.dart';
import '../ui/screens/verify_phone/verify_phone_view.dart';

class Routes {
  static const String rootScreenView = '/';
  static const String demoScreenView = '/demo-screen-view';
  static const String homeScreenView = '/home-screen-view';
  static const String loginScreenView = '/login-screen-view';
  static const String registerScreenView = '/register-screen-view';
  static const String forgotPasswordScreenView = '/forgot-password-screen-view';
  static const String verifyPhoneScreenView = '/verify-phone-screen-view';
  static const String verifyEmailScreenView = '/verify-email-screen-view';
  static const String courseContentListScreenView =
      '/course-content-list-screen-view';
  static const String courseContentDetailScreenView =
      '/course-content-detail-screen-view';
  static const String userProfileScreenView = '/user-profile-screen-view';
  static const all = <String>{
    rootScreenView,
    demoScreenView,
    homeScreenView,
    loginScreenView,
    registerScreenView,
    forgotPasswordScreenView,
    verifyPhoneScreenView,
    verifyEmailScreenView,
    courseContentListScreenView,
    courseContentDetailScreenView,
    userProfileScreenView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.rootScreenView, page: RootScreenView),
    RouteDef(Routes.demoScreenView, page: DemoScreenView),
    RouteDef(Routes.homeScreenView, page: HomeScreenView),
    RouteDef(Routes.loginScreenView, page: LoginScreenView),
    RouteDef(Routes.registerScreenView, page: RegisterScreenView),
    RouteDef(Routes.forgotPasswordScreenView, page: ForgotPasswordScreenView),
    RouteDef(Routes.verifyPhoneScreenView, page: VerifyPhoneScreenView),
    RouteDef(Routes.verifyEmailScreenView, page: VerifyEmailScreenView),
    RouteDef(Routes.courseContentListScreenView,
        page: CourseContentListScreenView),
    RouteDef(Routes.courseContentDetailScreenView,
        page: CourseContentDetailScreenView),
    RouteDef(Routes.userProfileScreenView, page: UserProfileScreenView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    RootScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RootScreenView(),
        settings: data,
      );
    },
    DemoScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DemoScreenView(),
        settings: data,
      );
    },
    HomeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeScreenView(),
        settings: data,
      );
    },
    LoginScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginScreenView(),
        settings: data,
      );
    },
    RegisterScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RegisterScreenView(),
        settings: data,
      );
    },
    ForgotPasswordScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ForgotPasswordScreenView(),
        settings: data,
      );
    },
    VerifyPhoneScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const VerifyPhoneScreenView(),
        settings: data,
      );
    },
    VerifyEmailScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const VerifyEmailScreenView(),
        settings: data,
      );
    },
    CourseContentListScreenView: (data) {
      var args = data.getArgs<CourseContentListScreenViewArguments>(
        orElse: () => CourseContentListScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CourseContentListScreenView(
          key: args.key,
          course: args.course,
        ),
        settings: data,
      );
    },
    CourseContentDetailScreenView: (data) {
      var args = data.getArgs<CourseContentDetailScreenViewArguments>(
        orElse: () => CourseContentDetailScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CourseContentDetailScreenView(
          key: args.key,
          course: args.course,
        ),
        settings: data,
      );
    },
    UserProfileScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UserProfileScreenView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CourseContentListScreenView arguments holder class
class CourseContentListScreenViewArguments {
  final Key key;
  final Course course;
  CourseContentListScreenViewArguments({this.key, this.course});
}

/// CourseContentDetailScreenView arguments holder class
class CourseContentDetailScreenViewArguments {
  final Key key;
  final Course course;
  CourseContentDetailScreenViewArguments({this.key, this.course});
}
