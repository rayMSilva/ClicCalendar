import 'package:fitapp/app/modules/novo.horario/controller.dart';
import 'package:fitapp/app/modules/novo.horario/repository.dart';
import 'package:get/get.dart';

class NovoHorarioBinding implements Bindings {
  // TODO: Adicionar dependências (Providers, API, etc)

  @override
  void dependencies() {
    Get.lazyPut<NovoHorarioController>(
      () => NovoHorarioController(
        repository: NovoHorarioRepository(),
      ),
    );
  }
}
