import 'package:fitapp/app/clic.calendar.dart';
import 'package:fitapp/app/core/dados.dart';
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

  runApp(const ClicCalendar());
}
