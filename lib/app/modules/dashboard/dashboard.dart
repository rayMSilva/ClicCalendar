import 'package:fitapp/app/modules/widgets/clic.app.bar.dart';
import 'package:fitapp/app/modules/widgets/clic.card.simples.dart';
import 'package:fitapp/app/routes/pages.dart';
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
      appBar: ClicAppBar(
        title: 'clicCalendar',
        titleIcon: Icons.calendar_today,
        iconleading: Icons.arrow_back_ios_sharp,
        leadingFunction: () {
          Get.toNamed(Routes.login);
        },
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: Column(
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
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Wrap(
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
                  ),
                ),
                Container(
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
              ],
            ),
          );
        }),
      ),
    );
  }
}
