import 'package:fitapp/app/data/models/usuario.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

setUsuarioSharedPreferences(Usuario usuario) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('kUsuario', usuario.userName!);
  prefs.setString('kSenha', usuario.senha!);
  prefs.setBool('kLogado', true);
}

setConfigSharedPreferences(host, porta) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('kHost', host);
  prefs.setString('kPorta', porta);
}

setTokenSharedPreferences(token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('kToken', token);
}

Future<String?> getTokenSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('kToken');
}

Future<Map<String, dynamic>?> getUsuarioSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userName = prefs.getString('kUsuario');
  String? senha = prefs.getString('kSenha');

  if (userName != null && senha != null) {
    return {
      'userName': userName,
      'senha': senha,
    };
  }
  return null;
}

cleanUsuarioSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('kToken', '');
  prefs.setInt('kUsuario', 0);
  prefs.setString('kSenha', '');
  prefs.setBool('kLogado', false);
  prefs.setBool('kPrimeiroLogin', true);
}
