import 'package:fitapp/app/core/theme/app.theme.dart';
import 'package:fitapp/app/modules/widgets/clic.app.bar.dart';
import 'package:fitapp/app/modules/widgets/clic.button.dart';
import 'package:fitapp/app/modules/widgets/click.field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/cadastro/controller.dart';

class CadastroPage extends GetView<CadastroController> {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: ClicAppBar(
        title: "Usuário",
        titleIcon: Icons.person,
        iconleading: Icons.arrow_back_ios_rounded,
        leadingFunction: () {
          Get.back();
        },
      ),
      floatingActionButton: ClicButton(
        onPressed: () {},
        title: "salvar",
        backgroundColor: AppTheme.lightTheme.colorScheme.primary,
        minimumSize: Size(MediaQuery.of(context).size.width / 1.5, 50),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.loginFormKey,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              child: Obx(
                () {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: ClicField(
                              label: 'user *',
                              focusNode: controller.userFocusNode.value,
                              controller: controller.userTextController.value,
                              onEditingComplete: () {},
                              keyboardType: TextInputType.number,
                              style: FieldStyle.elevated,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ClicField(
                              label: 'password *',
                              focusNode: controller.passwordFocusNode.value,
                              controller: controller.passwordTextController.value,
                              onEditingComplete: () {},
                              keyboardType: TextInputType.number,
                              style: FieldStyle.elevated,
                            ).marginOnly(left: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          ClicField(
                            label: 'name *',
                            focusNode: controller.nomeFocusNode.value,
                            controller: controller.nomeTextController.value,
                            onEditingComplete: () {},
                            keyboardType: TextInputType.text,
                            style: FieldStyle.elevated,
                          ),
                          const SizedBox(height: 16),
                          ClicField(
                            label: 'e-mail *',
                            focusNode: controller.emailFocusNode.value,
                            controller: controller.emailTextController.value,
                            onEditingComplete: () {},
                            keyboardType: TextInputType.text,
                            style: FieldStyle.elevated,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: ClicField(
                              label: 'telefone *',
                              focusNode: controller.telefoneFocusNode.value,
                              controller: controller.telefoneTextController.value,
                              onEditingComplete: () {},
                              keyboardType: TextInputType.text,
                              style: FieldStyle.elevated,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Flexible(
                            flex: 1,
                            child: ClicField(
                              label: 'permissão *',
                              focusNode: controller.permissaoFocusNode.value,
                              controller: controller.permissaoTextController.value,
                              onEditingComplete: () {},
                              keyboardType: TextInputType.text,
                              style: FieldStyle.elevated,
                            ).marginOnly(left: 20),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
