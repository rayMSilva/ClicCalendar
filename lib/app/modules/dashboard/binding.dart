import 'package:fitapp/app/modules/dashboard/controller.dart';
import 'package:fitapp/app/modules/dashboard/repository.dart';
import 'package:get/get.dart';

class DashboardBinding implements Bindings {

  // TODO: Adicionar dependências (Providers, API, etc)

  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(
        repository: DashboardRepository(),
      ),
    );
  }

}