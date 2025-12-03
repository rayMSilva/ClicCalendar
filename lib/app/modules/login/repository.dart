import 'package:fitapp/app/data/models/usuario.model.dart';
import 'package:fitapp/app/data/providers/usuario.provider.dart';

abstract interface class ILoginRepository {
  Future<void> login(Usuario usuario);
}

class LoginRepository extends ILoginRepository {
  final UsuarioProvider usuarioProvider;

  LoginRepository({
    required UsuarioProvider usuarioProvider,
  }) : usuarioProvider = usuarioProvider;

  @override
  Future<void> login(Usuario usuario) async {
    return await usuarioProvider.login(usuario: usuario);
  }
}
