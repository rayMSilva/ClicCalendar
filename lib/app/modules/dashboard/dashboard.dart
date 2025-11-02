import 'package:fitapp/app/modules/widgets/clic.app.bar.dart';
import 'package:fitapp/app/modules/widgets/clic.card.simples.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/dashboard/controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      endDrawer: const Drawer(),
      resizeToAvoidBottomInset: false,
      appBar: const ClicAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Center(
                  child: Text(
                    "Olá Fernanda 👋🏻,\nBem-vindo(a) à sua agenda!!",
                    style: Get.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ),
              Wrap(
                runSpacing: 8,
                spacing: 10,
                children: [
                  for (int i = 0; i < controller.cards.length; i++)
                    CardSimples(
                      onTap: () {
                        Get.toNamed(controller.cards[i]["page"]);
                      },
                      titulo: controller.cards[i]["titulo"],
                      icon: controller.cards[i]["icone"],
                    ),
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(30, 5, 30, 5),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "version: 1.0.0",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "data:07/11/2007",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
