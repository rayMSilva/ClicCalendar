import 'package:get/get.dart';
import 'package:fitapp/app/modules/metricas/repository.dart';


class MetricasController extends GetxController {

  final MetricasRepository _repository;
  MetricasController({
    required MetricasRepository repository
  }) : _repository = repository;


}
