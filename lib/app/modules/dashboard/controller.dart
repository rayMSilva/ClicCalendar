import 'package:get/get.dart';
import 'package:fitapp/app/modules/dashboard/repository.dart';


class DashboardController extends GetxController {

  final DashboardRepository _repository;
  DashboardController({
    required DashboardRepository repository
  }) : _repository = repository;


}
