import 'package:fitapp/app/data/models/base.model.dart';
import 'package:fitapp/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/login/repository.dart';

class LoginController extends GetxController {
  final LoginRepository _repository;

  LoginController({required LoginRepository repository}) : _repository = repository;

  RxList<UserColaborador> users = <UserColaborador>[].obs;

  RxBool loading = false.obs;

  final Rx<TextEditingController> userController = TextEditingController().obs;
  final Rx<FocusNode> userFocus = FocusNode().obs;

  final Rx<TextEditingController> passwordController = TextEditingController().obs;
  final Rx<FocusNode> passwordFocus = FocusNode().obs;

  @override
  void onInit() async {
    loading(true);
    await fetchAllBases();
    super.onInit();
    loading(false);
  }

  @override
  void onClose() {
    userController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }

  Future<void> fetchAllBases() async {
    try {
      users.value = await _repository.fetchAllBases();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> entrar() async {
    try {
      loading(true);
      if (userController.value.text == users[0].user && passwordController.value.text == users[0].password) {
        Get.toNamed(Routes.dashboard);
      }
      loading(false);
    } catch (e) {
      loading(false);
      rethrow;
    }
  }
}
