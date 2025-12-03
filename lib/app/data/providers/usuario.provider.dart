import 'dart:convert';

import 'package:fitapp/app/api/http.helper.dart';
import 'package:fitapp/app/data/models/usuario.model.dart';
import 'package:fitapp/app/data/services/shared.preferences.dart';
import 'package:fitapp/app/exceptions/conexao.exception.dart';
import 'package:fitapp/app/exceptions/login.exception.dart';

abstract interface class IUsuarioProvider {
  Future<void> login({required Usuario usuario});
}

class UsuarioProvider implements IUsuarioProvider {
  @override
  Future<void> login({required Usuario usuario}) async {
    try {
      await HttpHelper().isOnline();
      var response = await HttpHelper().post('/auth/login', null, {"username": usuario.userName, "password": usuario.senha});
      if (response.statusCode == 200) {
        Map<String, dynamic> returnData = await json.decode(response.body);
        await setTokenSharedPreferences(returnData['access_token']);
        await setUsuarioSharedPreferences(usuario);
      } else {
        throw ("Login ou Senha incorretas!");
      }
    } on ConexaoException {
      rethrow;
    } on LoginException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  // Future<Usuario> cadastrar(Usuario usuario) async {
  //   final response = await api.postRequest('/auth/usuarios', usuario.toJson());
  //   return Usuario.fromJson(response);
  // }

  // Future<Map<String, dynamic>> login(Usuario usuario) async {
  //   final response = await api.postRequest('/auth/login', usuario.toJsonLogin());
  //   return response;
  // }

  // Future<Usuario> editar(int id, Usuario usuario) async {
  //   final response = await api.putRequest('/auth/usuarios/me', usuario.toJson());
  //   return Usuario.fromJson(response);
  // }

  // Future<List<Usuario>> buscarUsuarios() async {
  //   final response = await api.getRequest('/auth/usuarios');
  //   return (response as List).map((json) => Usuario.fromJson(json)).toList();
  // }
}
