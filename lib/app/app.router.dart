// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/screens/demo/demo_view.dart';
import '../ui/screens/forgot_password/forgot_password_view.dart';
import '../ui/screens/home/home_view.dart';
import '../ui/screens/login/login_view.dart';
import '../ui/screens/register/register_view.dart';

class Routes {
  static const String demoScreenView = '/';
  static const String homeScreenView = '/home-screen-view';
  static const String loginScreenView = '/login-screen-view';
  static const String registerScreenView = '/register-screen-view';
  static const String forgotPasswordScreenView = '/forgot-password-screen-view';
  static const all = <String>{
    demoScreenView,
    homeScreenView,
    loginScreenView,
    registerScreenView,
    forgotPasswordScreenView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.demoScreenView, page: DemoScreenView),
    RouteDef(Routes.homeScreenView, page: HomeScreenView),
    RouteDef(Routes.loginScreenView, page: LoginScreenView),
    RouteDef(Routes.registerScreenView, page: RegisterScreenView),
    RouteDef(Routes.forgotPasswordScreenView, page: ForgotPasswordScreenView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
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
  };
}
