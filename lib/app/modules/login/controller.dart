import 'package:fitapp/app/core/dados.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/login/repository.dart';
import 'package:fitapp/app/routes/pages.dart';

class LoginController extends GetxController {
  final LoginRepository _repository;
  final Dados dados;
  final loginFormKey = GlobalKey<FormState>();

  LoginController({required this.dados, required LoginRepository repository}) : _repository = repository;

  RxBool loading = false.obs;
  RxBool obscureText = true.obs;

  Rx<TextEditingController> userController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  Rx<FocusNode> userFocus = FocusNode().obs;
  Rx<FocusNode> passwordFocus = FocusNode().obs;

  @override
  void onInit() {
    loading(true);
    loading(false);
    super.onInit();
  }

  @override
  void onClose() {
    userController.value.dispose();
    passwordController.value.dispose();
    userFocus.value.dispose();
    passwordFocus.value.dispose();
    super.onClose();
  }

  void handleObscureText() => obscureText.value = !obscureText.value;

  Future<void> entrar() async {
    if (!loginFormKey.currentState!.validate()) return;

    try {
      loading(true);

      if (userController.value.text.isEmpty || passwordController.value.text.isEmpty) {
        throw Exception('Preencha todos os campos');
      }
      Dados.instance.usuario.userName = userController.value.text;
      Dados.instance.usuario.senha = passwordController.value.text;

      await _repository.login(Dados.instance.usuario);

      Get.offAllNamed(Routes.dashboard);
    } catch (e) {
      String mensagem = 'Falha ao fazer login.';

      if (e.toString().contains('incorretas')) {
        mensagem = 'Credenciais inválidas';
      } else if (e.toString().contains('Preencha')) {
        mensagem = e.toString().replaceAll('Exception:', '').trim();
      }

      Get.snackbar(
        'Erro',
        mensagem,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      loading(false);
    }
  }
}
