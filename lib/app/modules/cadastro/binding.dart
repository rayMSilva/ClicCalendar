import 'package:fitapp/app/modules/cadastro/controller.dart';
import 'package:fitapp/app/modules/cadastro/repository.dart';
import 'package:get/get.dart';

class CadastroBinding implements Bindings {

  // TODO: Adicionar dependências (Providers, API, etc)

  @override
  void dependencies() {
    Get.lazyPut<CadastroController>(
      () => CadastroController(
        repository: CadastroRepository(),
      ),
    );
  }

}