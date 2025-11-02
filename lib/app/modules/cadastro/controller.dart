import 'package:get/get.dart';
import 'package:fitapp/app/modules/cadastro/repository.dart';


class CadastroController extends GetxController {

  final CadastroRepository _repository;
  CadastroController({
    required CadastroRepository repository
  }) : _repository = repository;


}
