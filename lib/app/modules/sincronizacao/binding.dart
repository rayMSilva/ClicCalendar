import 'package:fitapp/app/modules/sincronizacao/controller.dart';
import 'package:fitapp/app/modules/sincronizacao/repository.dart';
import 'package:get/get.dart';

class SincronizacaoBinding implements Bindings {

  // TODO: Adicionar dependências (Providers, API, etc)

  @override
  void dependencies() {
    Get.lazyPut<SincronizacaoController>(
      () => SincronizacaoController(
        repository: SincronizacaoRepository(),
      ),
    );
  }

}