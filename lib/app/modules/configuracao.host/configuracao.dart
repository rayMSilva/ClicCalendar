import 'package:fitapp/app/core/utils/validator.fields.dart';
import 'package:fitapp/app/modules/widgets/clic.app.bar.dart';
import 'package:fitapp/app/modules/widgets/clic.button.dart';
import 'package:fitapp/app/modules/widgets/click.field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/configuracao.host/controller.dart';

class ConfiguracaoPage extends GetView<ConfiguracaoController> {
  const ConfiguracaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: ClicAppBar(
        title: 'Configuração',
        titleIcon: Icons.settings,
        iconleading: Icons.arrow_back_ios_sharp,
        leadingFunction: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: const Text(
                        "main host",
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: SizedBox(
                            child: Obx(
                              () {
                                return ClicField(
                                  label: "host",
                                  controller: controller.hostTextController.value,
                                  focusNode: controller.hostFocusNode.value,
                                  keyboardType: TextInputType.text,
                                  style: FieldStyle.elevated,
                                  validator: (value) => FieldValidator.validateIfEmpty(value),
                                  onEditingComplete: () {
                                    controller.hostFocusNode.value.unfocus();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            child: Obx(
                              () {
                                return ClicField(
                                  label: "porta",
                                  controller: controller.portaTextController.value,
                                  focusNode: controller.portaFocusNode.value,
                                  keyboardType: TextInputType.text,
                                  style: FieldStyle.elevated,
                                  validator: (value) => FieldValidator.validateIfEmpty(value),
                                  onEditingComplete: () {
                                    controller.portaFocusNode.value.unfocus();
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(() {
                      return controller.loading.value
                          ? const CircularProgressIndicator()
                          : ClicButton(
                              onPressed: controller.salvarConfiguracoesHost,
                              title: "salvar",
                              backgroundColor: Get.theme.colorScheme.primary,
                              minimumSize: Size(displayWidth / 1.5, 50),
                            ).marginOnly(top: 150);
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
