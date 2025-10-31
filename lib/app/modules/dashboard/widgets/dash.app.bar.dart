import 'package:fitapp/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashAppBar extends StatelessWidget {
  const DashAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.login);
          },
          icon: const Icon(Icons.close)),
      title: Center(
        child: Text(
          "clicCalendar",
          style: TextStyle(color: Get.theme.colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
