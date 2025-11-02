import 'package:fitapp/app/modules/metricas/controller.dart';
import 'package:fitapp/app/modules/metricas/repository.dart';
import 'package:get/get.dart';

class MetricasBinding implements Bindings {

  // TODO: Adicionar dependências (Providers, API, etc)

  @override
  void dependencies() {
    Get.lazyPut<MetricasController>(
      () => MetricasController(
        repository: MetricasRepository(),
      ),
    );
  }

}