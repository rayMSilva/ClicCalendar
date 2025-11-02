import 'package:get/get.dart';
import 'package:fitapp/app/modules/sincronizacao/repository.dart';


class SincronizacaoController extends GetxController {

  final SincronizacaoRepository _repository;
  SincronizacaoController({
    required SincronizacaoRepository repository
  }) : _repository = repository;


}
