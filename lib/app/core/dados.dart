import 'package:fitapp/app/data/models/usuario.model.dart';

class Dados {
  static final Dados instance = Dados._internal();
  Dados._internal();

  late Usuario usuario;
  late String token;

  Future<void> init() async {
    usuario = Usuario();
    token = '';
  }

  void limpar() {
    usuario = Usuario();
    token = '';
  }

  bool get estaLogado => token.isNotEmpty;
}
