import 'package:br_validators/masks/br_masks.dart';
import 'package:fitapp/app/core/theme/app.theme.dart';
import 'package:fitapp/app/modules/widgets/clic.app.bar.dart';
import 'package:fitapp/app/modules/widgets/clic.button.dart';
import 'package:fitapp/app/modules/widgets/click.field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitapp/app/modules/cadastro/controller.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

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
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          Text(
                            "Criação de Usuário",
                            style: Get.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.secondary),
                          ),
                          const CircleAvatar(
                            child: Icon(
                              Icons.person_add,
                              color: Colors.white,
                            ),
                          ).marginOnly(left: 20),
                        ],
                      ),
                      const SizedBox(height: 50),
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
                            keyboardType: TextInputType.emailAddress,
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
                              inputFormatters: [BRMasks.mobilePhone],
                              focusNode: controller.telefoneFocusNode.value,
                              controller: controller.telefoneTextController.value,
                              onEditingComplete: () {},
                              keyboardType: TextInputType.number,
                              style: FieldStyle.elevated,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(8),
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            initialValue: controller.permissaoTextController.value.text.isNotEmpty ? controller.permissaoTextController.value.text : null,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              alignLabelWithHint: true,
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: AutoSizeText(
                                      'permissão',
                                      maxLines: 1,
                                      style: Get.theme.textTheme.titleMedium?.copyWith(
                                        color: Get.theme.colorScheme.tertiary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      minFontSize: 4,
                                    ),
                                  ),
                                ],
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: '',
                                child: Text(
                                  'selecione',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'funcionario',
                                child: Text(
                                  'Funcionário',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Administrador',
                                child: Text(
                                  'Administrador',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                            onChanged: (v) {
                              if (v != null) controller.permissaoTextController.value.text = v;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      ClicButton(
                        onPressed: () {},
                        title: "salvar",
                        backgroundColor: AppTheme.lightTheme.colorScheme.primary,
                        minimumSize: Size(MediaQuery.of(context).size.width / 1.5, 50),
                      )
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
