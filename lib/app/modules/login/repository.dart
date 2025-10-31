import 'package:fitapp/app/data/models/base.model.dart';
import 'package:fitapp/app/data/providers/base.provider.dart';

abstract interface class ILoginRepository {
  Future<List<UserColaborador>> fetchAllBases();
}

class LoginRepository implements ILoginRepository {
  final BaseProvider _baseProvider;

  LoginRepository({
    required BaseProvider baseProvider,
  }) : _baseProvider = baseProvider;

  @override
  Future<List<UserColaborador>> fetchAllBases() {
    try {
      return _baseProvider.fetchAllBases();
    } catch (e) {
      rethrow;
    }
  }
}
