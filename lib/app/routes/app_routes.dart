part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const PROFILE = _Paths.PROFILE;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const SIGN_UP = _Paths.SIGN_UP;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const PROFILE = '/profile';
  static const EDIT_PROFILE = '/edit-profile';
  static const SIGN_UP = '/sign-up';
}