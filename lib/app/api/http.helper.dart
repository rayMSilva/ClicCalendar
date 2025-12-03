import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fitapp/app/exceptions/autorizacao.exception.dart';
import 'package:fitapp/app/exceptions/conexao.exception.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpHelper {
  late Map<String, String> header;

  Future<dynamic> isOnline() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? host = prefs.getString('kHost');
    String? porta = prefs.getString('kPorta');
    bool conexao = false;

    if (host == null || host.isEmpty || porta == null || porta.isEmpty) {
      if (kDebugMode) print("Host ou porta não configurados!");
      throw ConexaoException(message: "Host ou porta não configurados!");
    }

    await Socket.connect(host, int.parse(porta), timeout: const Duration(seconds: 10)).then((socket) {
      if (kDebugMode) print("Conexão estabelecida!");
      socket.destroy();
      conexao = true;
    }).catchError((error) {
      if (error.message.contains("Connection timed out") || error.message.contains("TimeoutException")) {
        conexao = false;
        throw ConexaoException(message: "Tempo de conexão esgotado!");
      } else if (error.message.contains("Connection failed")) {
        conexao = false;
        throw ConexaoException(message: "Falha na conexão!");
      } else if (error.message.contains("No route to host")) {
        conexao = false;
        throw ConexaoException(message: "TopServer não encontrado no host informado!");
      } else {
        conexao = false;
        throw ConexaoException(message: "${error.message}");
      }
    });

    return conexao;
  }

  Future<dynamic> post(String endpoint, dynamic token, dynamic body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? host = prefs.getString('kHost');
    String? porta = prefs.getString('kPorta');

    if (host == null || host.isEmpty || porta == null || porta.isEmpty) {
      if (kDebugMode) print("Host ou porta não configurados!");
      throw ConexaoException(message: "Host ou porta não configurados!");
    }

    String path = 'http://$host:$porta';

    token != '' ? header = {'Content-Type': "application/json", 'Authorization': "Bearer $token"} : header = {'Content-Type': "application/json"};
    try {
      var request = await http.post(Uri.parse(path + endpoint), headers: header, body: jsonEncode(body)).timeout(const Duration(seconds: 10));

      return request;
    } catch (e) {
      if (e.toString().contains("Connection timed out") || e.toString().contains("TimeoutException")) {
        throw ConexaoException(message: "Tempo de conexão esgotado!");
      } else if (e.toString().contains("No route to host")) {
        throw ConexaoException(message: "TopServer não encontrado no host informado!");
      } else if (e.toString().contains("Connection failed")) {
        throw ConexaoException(message: "Falha na conexão!");
      }
      rethrow;
    }
  }

  Future<dynamic> get(String endpoint, dynamic token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? host = prefs.getString('kHost');
    String? porta = prefs.getString('kPorta');

    if (host == null || host.isEmpty || porta == null || porta.isEmpty) {
      if (kDebugMode) print("Host ou porta não configurados!");
      throw ConexaoException(message: "Host ou porta não configurados!");
    }

    String path = 'http://$host:$porta';

    Response response = Response('', 404);

    token != null ? header = {'Content-Type': "application/json", 'Authorization': "Bearer $token"} : header = {'Content-Type': "application/json"};
    try {
      response = await http.get(Uri.parse(path + endpoint), headers: header).timeout(const Duration(seconds: 15));
      if (response.statusCode == 401) {
        throw AutorizacaoException(message: "Token inválido!");
      }
    } catch (e) {
      if (e.toString().contains("Connection timed out") || e.toString().contains("TimeoutException")) {
        throw ConexaoException(message: "Tempo de conexão esgotado!");
      } else if (e.toString().contains("No route to host")) {
        throw ConexaoException(message: "TopServer não encontrado no host informado!");
      } else if (e.toString().contains("Connection failed")) {
        throw ConexaoException(message: "Falha na conexão!");
      }
      rethrow;
    }
    return response;
  }

  Future<dynamic> put(String endpoint, dynamic token, dynamic body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? host = prefs.getString('kHost');
    String? porta = prefs.getString('kPorta');

    if (host == null || host.isEmpty || porta == null || porta.isEmpty) {
      if (kDebugMode) print("Host ou porta não configurados!");
      throw ConexaoException(message: "Host ou porta não configurados!");
    }

    String path = 'http://$host:$porta';

    token != '' ? header = {'Content-Type': "application/json", 'Authorization': "Bearer $token"} : header = {'Content-Type': "application/json"};
    try {
      var request = await http
          .put(
            Uri.parse(path + endpoint),
            headers: header,
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 10));

      return request;
    } catch (e) {
      if (e.toString().contains("Connection timed out") || e.toString().contains("TimeoutException")) {
        throw ConexaoException(message: "Tempo de conexão esgotado!");
      } else if (e.toString().contains("No route to host")) {
        throw ConexaoException(message: "TopServer não encontrado no host informado!");
      } else if (e.toString().contains("Connection failed")) {
        throw ConexaoException(message: "Falha na conexão!");
      }
      rethrow;
    }
  }
}
