// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebasepractise/FB/ForgotPass_page/Forgot_view.dart' as _i4;
import 'package:firebasepractise/FB/Home_page/Chat_room.dart' as _i7;
import 'package:firebasepractise/FB/Home_page/Home_view.dart' as _i3;
import 'package:firebasepractise/FB/Home_page/Select.dart' as _i8;
import 'package:firebasepractise/FB/Login_page/Login_view.dart' as _i2;
import 'package:firebasepractise/FB/Phone_verification_page/phoneVer_view.dart'
    as _i6;
import 'package:firebasepractise/FB/SignUp_page/SignUp_view.dart' as _i5;
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i10;

class Routes {
  static const loginScreen = '/login-screen';

  static const homePage = '/home-page';

  static const forgotPass = '/forgot-pass';

  static const signUpScreen = '/sign-up-screen';

  static const phoneScreen = '/phone-screen';

  static const chatHere = '/chat-here';

  static const select = '/Select';

  static const all = <String>{
    loginScreen,
    homePage,
    forgotPass,
    signUpScreen,
    phoneScreen,
    chatHere,
    select,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginScreen,
      page: _i2.LoginScreen,
    ),
    _i1.RouteDef(
      Routes.homePage,
      page: _i3.HomePage,
    ),
    _i1.RouteDef(
      Routes.forgotPass,
      page: _i4.ForgotPass,
    ),
    _i1.RouteDef(
      Routes.signUpScreen,
      page: _i5.SignUpScreen,
    ),
    _i1.RouteDef(
      Routes.phoneScreen,
      page: _i6.PhoneScreen,
    ),
    _i1.RouteDef(
      Routes.chatHere,
      page: _i7.ChatHere,
    ),
    _i1.RouteDef(
      Routes.select,
      page: _i8.Select,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoginScreen(),
        settings: data,
      );
    },
    _i3.HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.HomePage(),
        settings: data,
      );
    },
    _i4.ForgotPass: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.ForgotPass(),
        settings: data,
      );
    },
    _i5.SignUpScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SignUpScreen(),
        settings: data,
      );
    },
    _i6.PhoneScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.PhoneScreen(),
        settings: data,
      );
    },
    _i7.ChatHere: (data) {
      final args = data.getArgs<ChatHereArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i7.ChatHere(
            key: args.key, userMap: args.userMap, chatRoomId: args.chatRoomId),
        settings: data,
      );
    },
    _i8.Select: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.Select(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ChatHereArguments {
  const ChatHereArguments({
    this.key,
    required this.userMap,
    required this.chatRoomId,
  });

  final _i9.Key? key;

  final Map<String, dynamic> userMap;

  final String chatRoomId;
}

extension NavigatorStateExtension on _i10.NavigationService {
  Future<dynamic> navigateToLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomePage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homePage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPass([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPass,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPhoneScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.phoneScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatHere({
    _i9.Key? key,
    required Map<String, dynamic> userMap,
    required String chatRoomId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chatHere,
        arguments: ChatHereArguments(
            key: key, userMap: userMap, chatRoomId: chatRoomId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSelect([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.select,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomePage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homePage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPass([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPass,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPhoneScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.phoneScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatHere({
    _i9.Key? key,
    required Map<String, dynamic> userMap,
    required String chatRoomId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chatHere,
        arguments: ChatHereArguments(
            key: key, userMap: userMap, chatRoomId: chatRoomId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSelect([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.select,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
