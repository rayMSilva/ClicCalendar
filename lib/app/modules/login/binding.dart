import 'package:fitapp/app/modules/login/controller.dart';
import 'package:fitapp/app/modules/login/repository.dart';
import 'package:fitapp/app/data/providers/base.provider.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  // TODO: Adicionar dependências (Providers, API, etc)

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        repository: LoginRepository(
          baseProvider: BaseProvider(),
        ),
      ),
    );
  }
}
