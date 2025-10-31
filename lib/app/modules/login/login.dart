import 'package:fitapp/app/core/utils/validator.fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/widgets/click.field.dart';
import 'package:fitapp/app/core/theme/app.theme.dart';
import 'package:fitapp/app/modules/login/controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsetsGeometry.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: const Center(
                child: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 50),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
                      ),
                    ),
                    SizedBox(
                      width: displayWidth / 1.4,
                      child: ClicField(
                        label: "Usuário",
                        keyboardType: TextInputType.number,
                        controller: controller.userController.value,
                        focusNode: controller.userFocus.value,
                        style: FieldStyle.outlined,
                        validator: (value) => FieldValidator.validateIfEmpty(value),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                      width: displayWidth,
                    ),
                    SizedBox(
                      width: displayWidth / 1.4,
                      child: Obx(
                        () => ClicField(
                          label: "Senha",
                          keyboardType: TextInputType.text,
                          controller: controller.passwordController.value,
                          focusNode: controller.passwordFocus.value,
                          style: FieldStyle.outlined,
                          hide: controller.obscureText.value,
                          icon: Icon(
                            controller.obscureText.value ? Icons.visibility : Icons.visibility_off,
                            color: Get.theme.colorScheme.tertiary,
                          ),
                          rightIconFunction: controller.handleObscureText,
                          validator: (value) => FieldValidator.validateIfEmpty(value),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Obx(
                      () => SizedBox(
                        width: displayWidth / 1.6,
                        height: 50,
                        child: controller.loading.value
                            ? const Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                onPressed: controller.entrar,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.lightTheme.colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text(
                                  'Entrar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                      ),
                    ),
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
