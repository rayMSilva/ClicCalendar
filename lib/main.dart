import 'package:fitapp/app/clic.calendar.dart';
import 'package:fitapp/app/data/services/storage.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: load .env if exists
  // TODO: add google font license
  // TODO: add trusted certificate if needed

  await GetStorage.init();
  Get.put<StorageService>(StorageService());

  runApp(const ClicCalendar());
}
