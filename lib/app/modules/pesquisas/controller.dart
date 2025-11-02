import 'package:get/get.dart';
import 'package:fitapp/app/modules/pesquisas/repository.dart';


class PesquisasController extends GetxController {

  final PesquisasRepository _repository;
  PesquisasController({
    required PesquisasRepository repository
  }) : _repository = repository;


}
