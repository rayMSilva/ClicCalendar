import 'package:fitapp/app/clic.calendar.dart';
import 'package:fitapp/app/core/dados.dart';
import 'package:fitapp/app/data/providers/usuario.provider.dart';
import 'package:fitapp/app/data/services/shared.preferences.dart';
import 'package:fitapp/app/data/services/storage.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  await Dados.instance.init();
  Get.put<StorageService>(StorageService());

  String? initialRoute = await defineInitialRoute();

  runApp(ClicCalendar(
    initialRoute: initialRoute,
  ));
}

Future<String> defineInitialRoute() async {
  UsuarioProvider usuarioProvider = UsuarioProvider();
  String initialRoute = '/login';

  if (await usuarioProvider.hasSavedCredentials()) {
    final usuarioJson = await getUsuarioSharedPreferences();
    if (usuarioJson != null) {
      Dados.instance.usuario.userName = usuarioJson['userName'];
      Dados.instance.usuario.senha = usuarioJson['senha'];
      initialRoute = '/dashboard';
    }
  }
  return initialRoute;
}
