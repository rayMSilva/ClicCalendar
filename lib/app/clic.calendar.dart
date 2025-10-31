import 'package:fitapp/app/core/theme/app.theme.dart';
import 'package:fitapp/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClicCalendar extends StatelessWidget {
  const ClicCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      title: 'BaseApp',
      getPages: Pages.pages,
      initialRoute: Routes.login,
      locale: const Locale('pt', 'BR'),
    );
  }
}
