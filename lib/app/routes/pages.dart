import 'package:fitapp/app/modules/cadastro/binding.dart';
import 'package:fitapp/app/modules/cadastro/cadastro.dart';
import 'package:fitapp/app/modules/dashboard/binding.dart';
import 'package:fitapp/app/modules/dashboard/dashboard.dart';
import 'package:fitapp/app/modules/listar.agenda/binding.dart';
import 'package:fitapp/app/modules/listar.agenda/listar.agenda.dart';
import 'package:fitapp/app/modules/login/binding.dart';
import 'package:fitapp/app/modules/login/login.dart';
import 'package:fitapp/app/modules/metricas/binding.dart';
import 'package:fitapp/app/modules/metricas/metricas.dart';
import 'package:fitapp/app/modules/novo.horario/binding.dart';
import 'package:fitapp/app/modules/novo.horario/page.dart';
import 'package:fitapp/app/modules/pesquisas/binding.dart';
import 'package:fitapp/app/modules/pesquisas/page.dart';
import 'package:fitapp/app/modules/sincronizacao/binding.dart';
import 'package:fitapp/app/modules/sincronizacao/page.dart';
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
    ),
    GetPage(
      name: Routes.novoHorario,
      page: () => const NovoHorarioPage(),
      binding: NovoHorarioBinding(),
    ),
    GetPage(
      name: Routes.listarAgendas,
      page: () => const ListarAgendaPage(),
      binding: ListarAgendaBinding(),
    ),
    GetPage(
      name: Routes.pesquisas,
      page: () => const PesquisasPage(),
      binding: PesquisasBinding(),
    ),
    GetPage(
      name: Routes.cadastro,
      page: () => const CadastroPage(),
      binding: CadastroBinding(),
    ),
    GetPage(
      name: Routes.metricas,
      page: () => const MetricasPage(),
      binding: MetricasBinding(),
    ),
    GetPage(
      name: Routes.sincronizacao,
      page: () => const SincronizacaoPage(),
      binding: SincronizacaoBinding(),
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
