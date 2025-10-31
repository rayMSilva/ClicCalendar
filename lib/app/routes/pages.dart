import 'package:fitapp/app/modules/dashboard/binding.dart';
import 'package:fitapp/app/modules/dashboard/dashboard.dart';
import 'package:fitapp/app/modules/login/binding.dart';
import 'package:fitapp/app/modules/login/login.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class Pages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    )
    // GetPage(
    //   name: Routes.home,
    //   page: () => HomePage(),
    //   binding: HomeBinding(),
    //   middlewares: [AuthGuard()],
    //   children: [
    //     GetPage(
    //       name: Routes.home,
    //       page: () => HomeScreen(),
    //       binding: HomeBinding(),
    //     ),
    //     GetPage(
    //       name: Routes.esqueciSenha,
    //       page: () => EsqueciSenhaPage(),
    //       binding: EsqueciSenhaBinding(),
    //     ),
    //   ],
    // ),
  ];
}
