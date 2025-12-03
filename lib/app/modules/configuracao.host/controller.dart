import 'package:fitapp/app/data/services/shared.preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracaoController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  Rx<TextEditingController> hostTextController = TextEditingController().obs;
  Rx<FocusNode> hostFocusNode = FocusNode().obs;

  Rx<TextEditingController> portaTextController = TextEditingController().obs;
  Rx<FocusNode> portaFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loading(true);
    fetchConfiguracoesHost();
    loading(false);
  }

  Future<void> salvarConfiguracoesHost() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        String host = hostTextController.value.text.trim();
        String porta = portaTextController.value.text.trim();

        if (host.isNotEmpty && porta.isNotEmpty) {
          setConfigSharedPreferences(host, porta);
          Get.snackbar(
            'Sucesso',
            'Configurações salvas com sucesso.',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
          );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchConfiguracoesHost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? host = prefs.getString('kHost');
    String? porta = prefs.getString('kPorta');
    bool hasEndpointConfiguration = host != null && porta != null;
    if (hasEndpointConfiguration) {
      hostTextController.value.text = host;
      portaTextController.value.text = porta;
    }
  }
}
