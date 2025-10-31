part of 'pages.dart';

abstract class Routes {
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const esqueciSenha = _Paths.login + _Paths.esqueciSenha;
  static const dashboard = _Paths.dashboard;
}

abstract class _Paths {
  static const login = '/login';
  static const home = '/home';
  static const esqueciSenha = '/esqueci-senha';
  static const dashboard = '/dashboard';
}
