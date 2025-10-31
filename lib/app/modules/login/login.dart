import 'package:fitapp/app/modules/widgets/click.field.dart';
import 'package:fitapp/app/core/theme/app.theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/login/controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  label: "email ou usuário",
                  controller: controller.userController.value,
                  focusNode: controller.userFocus.value,
                  style: FieldStyle.outlined,
                ),
              ),
              const SizedBox(
                width: double.maxFinite,
                height: 6,
              ),
              SizedBox(
                width: displayWidth / 1.4,
                child: ClicField(
                  label: "senha",
                  controller: controller.passwordController.value,
                  focusNode: controller.passwordFocus.value,
                  style: FieldStyle.outlined,
                ),
              ),
              const SizedBox(
                width: double.maxFinite,
                height: 60,
              ),
              Obx(() {
                return controller.loading.value != true
                    ? SizedBox(
                        height: 50,
                        width: displayWidth / 1.6,
                        child: ElevatedButton(
                            onPressed: () {
                              controller.entrar();
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(AppTheme.lightTheme.colorScheme.primary),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )))
                    : const CircularProgressIndicator();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
