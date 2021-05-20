// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/course.dart';
import '../models/course_section_content.dart';
import '../models/institute.dart';
import '../ui/screens/course_content_detail/course_content_detail_view.dart';
import '../ui/screens/course_content_list/course_content_list_view.dart';
import '../ui/screens/demo/demo_view.dart';
import '../ui/screens/forgot_password/forgot_password_view.dart';
import '../ui/screens/home/home_view.dart';
import '../ui/screens/institute_course_detail/institute_course_detail_view.dart';
import '../ui/screens/institute_detail/institute_detail_view.dart';
import '../ui/screens/institute_list/institute_list_view.dart';
import '../ui/screens/join_a_course/join_a_course_view.dart';
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
  static const String joinACourseScreenView = '/join-acourse-screen-view';
  static const String instituteListScreenView = '/institute-list-screen-view';
  static const String instituteDetailScreenView =
      '/institute-detail-screen-view';
  static const String instituteCourseDetailScreenView =
      '/institute-course-detail-screen-view';
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
    joinACourseScreenView,
    instituteListScreenView,
    instituteDetailScreenView,
    instituteCourseDetailScreenView,
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
    RouteDef(Routes.joinACourseScreenView, page: JoinACourseScreenView),
    RouteDef(Routes.instituteListScreenView, page: InstituteListScreenView),
    RouteDef(Routes.instituteDetailScreenView, page: InstituteDetailScreenView),
    RouteDef(Routes.instituteCourseDetailScreenView,
        page: InstituteCourseDetailScreenView),
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
      var args = data.getArgs<HomeScreenViewArguments>(
        orElse: () => HomeScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreenView(
          key: args.key,
          index: args.index,
        ),
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
          courseSectionContent: args.courseSectionContent,
        ),
        settings: data,
      );
    },
    UserProfileScreenView: (data) {
      var args = data.getArgs<UserProfileScreenViewArguments>(
        orElse: () => UserProfileScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserProfileScreenView(key: args.key),
        settings: data,
      );
    },
    JoinACourseScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const JoinACourseScreenView(),
        settings: data,
      );
    },
    InstituteListScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const InstituteListScreenView(),
        settings: data,
      );
    },
    InstituteDetailScreenView: (data) {
      var args = data.getArgs<InstituteDetailScreenViewArguments>(
        orElse: () => InstituteDetailScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => InstituteDetailScreenView(
          key: args.key,
          institute: args.institute,
        ),
        settings: data,
      );
    },
    InstituteCourseDetailScreenView: (data) {
      var args = data.getArgs<InstituteCourseDetailScreenViewArguments>(
        orElse: () => InstituteCourseDetailScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => InstituteCourseDetailScreenView(
          key: args.key,
          institute: args.institute,
          course: args.course,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomeScreenView arguments holder class
class HomeScreenViewArguments {
  final Key key;
  final int index;
  HomeScreenViewArguments({this.key, this.index});
}

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
  final CourseSectionContent courseSectionContent;
  CourseContentDetailScreenViewArguments(
      {this.key, this.course, this.courseSectionContent});
}

/// UserProfileScreenView arguments holder class
class UserProfileScreenViewArguments {
  final Key key;
  UserProfileScreenViewArguments({this.key});
}

/// InstituteDetailScreenView arguments holder class
class InstituteDetailScreenViewArguments {
  final Key key;
  final Institute institute;
  InstituteDetailScreenViewArguments({this.key, this.institute});
}

/// InstituteCourseDetailScreenView arguments holder class
class InstituteCourseDetailScreenViewArguments {
  final Key key;
  final Institute institute;
  final Course course;
  InstituteCourseDetailScreenViewArguments(
      {this.key, this.institute, this.course});
}
