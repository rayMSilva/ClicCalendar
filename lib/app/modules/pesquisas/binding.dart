import 'package:fitapp/app/modules/pesquisas/controller.dart';
import 'package:fitapp/app/modules/pesquisas/repository.dart';
import 'package:get/get.dart';

class PesquisasBinding implements Bindings {

  // TODO: Adicionar dependências (Providers, API, etc)

  @override
  void dependencies() {
    Get.lazyPut<PesquisasController>(
      () => PesquisasController(
        repository: PesquisasRepository(),
      ),
    );
  }

}