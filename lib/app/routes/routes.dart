part of 'pages.dart';

abstract class Routes {
  static const home = _Paths.home;
  static const esqueciSenha = _Paths.login + _Paths.esqueciSenha;
  static const login = _Paths.login;
  static const dashboard = _Paths.dashboard;
  static const novoHorario = _Paths.novoHorario;
  static const listarAgendas = _Paths.listarAgendas;
  static const pesquisas = _Paths.pesquisas;
  static const cadastro = _Paths.cadastro;
  static const metricas = _Paths.metricas;
  static const sincronizacao = _Paths.sincronizacao;
  static const configuracao = _Paths.configuracao;
}

abstract class _Paths {
  static const login = '/login';
  static const home = '/home';
  static const esqueciSenha = '/esqueci-senha';
  static const dashboard = '/dashboard';
  static const novoHorario = '/novo-horario';
  static const listarAgendas = '/listar-agendas';
  static const pesquisas = '/pesquisas';
  static const cadastro = '/cadastro';
  static const metricas = '/metricas';
  static const sincronizacao = '/sincronizacao';
  static const configuracao = '/configuracao';
}
