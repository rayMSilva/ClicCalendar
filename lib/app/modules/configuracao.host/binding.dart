import 'package:fitapp/app/modules/configuracao.host/controller.dart';
import 'package:get/get.dart';

class ConfiguracaoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfiguracaoController>(
      () => ConfiguracaoController(),
    );
  }
}
