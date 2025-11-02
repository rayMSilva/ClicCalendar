import 'package:fitapp/app/modules/listar.agenda/controller.dart';
import 'package:fitapp/app/modules/listar.agenda/repository.dart';
import 'package:get/get.dart';

class ListarAgendaBinding implements Bindings {
  // TODO: Adicionar dependências (Providers, API, etc)

  @override
  void dependencies() {
    Get.lazyPut<ListarAgendaController>(
      () => ListarAgendaController(
        repository: ListarAgendaRepository(),
      ),
    );
  }
}
