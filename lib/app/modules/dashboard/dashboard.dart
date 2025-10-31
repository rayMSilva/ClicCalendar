import 'package:fitapp/app/modules/dashboard/widgets/dash.app.bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/dashboard/controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: Drawer(),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(preferredSize: Size(displayWidth, 80), child: const DashAppBar()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            width: displayWidth,
            height: displayHeigth,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Olá Fernanda 👋🏻,\nBem-vindo(a) à sua agenda!!",
                  style: Get.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Get.theme.colorScheme.tertiary.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.left,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
