import 'package:fitapp/app/data/models/base.model.dart';

abstract interface class IBaseProvider {
  Future<List<UserColaborador>> fetchAllBases();
}

class BaseProvider implements IBaseProvider {
  // final Api api;
  // final Database database; * se usar BaseDao torna-se desnecessário
  // final BaseDao baseDao; *

  // constructor para injetar dependências
  //BaseProvider({required this.api, required this.database, required this.baseDao});
  BaseProvider();

  @override
  Future<List<UserColaborador>> fetchAllBases() async {
    return List.generate(10, (index) {
      return UserColaborador(
        id: index,
        user: "Ray",
        password: "123",
      );
    });
  }
}
