import 'package:fitapp/app/data/models/base.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/login/repository.dart';
import 'package:fitapp/app/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final LoginRepository _repository;
  final loginFormKey = GlobalKey<FormState>();

  LoginController({required LoginRepository repository}) : _repository = repository;

  RxList<UserColaborador> users = <UserColaborador>[].obs;

  RxBool loading = false.obs;
  RxBool obscureText = true.obs;

  Rx<TextEditingController> userController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  Rx<FocusNode> userFocus = FocusNode().obs;
  Rx<FocusNode> passwordFocus = FocusNode().obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  Future<void> _initData() async {
    try {
      loading(true);
      await fetchAllBases();
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao carregar dados iniciais: $e');
    } finally {
      loading(false);
    }
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

  Future<void> fetchAllBases() async {
    try {
      users.value = await _repository.fetchAllBases();
    } catch (e) {
      throw Exception('Erro ao buscar bases: $e');
    }
  }

  Future<void> entrar() async {
    if (!loginFormKey.currentState!.validate()) return;

    try {
      loading(true);

      if (userController.value.text.isEmpty || passwordController.value.text.isEmpty) {
        throw Exception('Preencha todos os campos');
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('kToken', 'token-exemplo');

      Get.offAllNamed(Routes.dashboard);
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Falha ao fazer login: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      loading(false);
    }
  }
}
