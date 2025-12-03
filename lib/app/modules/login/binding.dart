import 'package:fitapp/app/core/dados.dart';
import 'package:fitapp/app/data/providers/usuario.provider.dart';
import 'package:fitapp/app/modules/login/controller.dart';
import 'package:fitapp/app/modules/login/repository.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        repository: LoginRepository(
          usuarioProvider: UsuarioProvider(),
        ),
        dados: Dados.instance,
      ),
    );
  }
}
