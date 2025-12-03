import 'package:fitapp/app/modules/widgets/clic.app.bar.dart';
import 'package:fitapp/app/modules/widgets/click.field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/cadastro/controller.dart';

class CadastroPage extends GetView<CadastroController> {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: ClicAppBar(
          title: "Usuário",
          titleIcon: Icons.person,
          iconleading: Icons.arrow_back_ios_rounded,
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
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: ClicField(
                              label: 'user',
                              focusNode: null,
                              controller: null,
                              onEditingComplete: () {},
                              keyboardType: TextInputType.number,
                              style: FieldStyle.elevated,
                            ).marginSymmetric(vertical: 10),
                          ),
                          Flexible(
                            flex: 1,
                            child: ClicField(
                              label: 'password',
                              focusNode: null,
                              controller: null,
                              onEditingComplete: () {},
                              keyboardType: TextInputType.number,
                              style: FieldStyle.elevated,
                            ).marginSymmetric(vertical: 10),
                          ),
                        ],
                      ).marginSymmetric(horizontal: 10),
                      Column(
                        children: [
                          ClicField(
                            label: 'name',
                            focusNode: null,
                            controller: null,
                            onEditingComplete: () {},
                            keyboardType: TextInputType.text,
                            style: FieldStyle.elevated,
                          ),
                          ClicField(
                            label: 'e-mail',
                            focusNode: null,
                            controller: null,
                            onEditingComplete: () {},
                            keyboardType: TextInputType.text,
                            style: FieldStyle.elevated,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ClicField(
                            label: 'telefone',
                            focusNode: null,
                            controller: null,
                            onEditingComplete: () {},
                            keyboardType: TextInputType.text,
                            style: FieldStyle.elevated,
                          ),
                          ClicField(
                            label: 'permissão',
                            focusNode: null,
                            controller: null,
                            onEditingComplete: () {},
                            keyboardType: TextInputType.text,
                            style: FieldStyle.elevated,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
