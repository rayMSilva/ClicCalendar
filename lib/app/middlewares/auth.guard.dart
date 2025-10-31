import 'package:fitapp/app/data/services/storage.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final StorageService storage = Get.find<StorageService>();
    if (storage.token == null) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
