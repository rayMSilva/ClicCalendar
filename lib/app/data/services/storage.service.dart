import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum StorageKey {
  token,
  userId,
}

class StorageService extends GetxService {
  final _box = GetStorage();
  final _token = RxnString();
  final _userId = RxnInt();

  String? get token => _token.value;
  int? get userId => _userId.value;

  @override
  void onInit() {
    _token.value = _box.read(StorageKey.token.toString());
    _userId.value = _box.read(StorageKey.userId.toString());

    _box.listenKey(StorageKey.token.toString(), (value) => _token.value = value);
    _box.listenKey(StorageKey.userId.toString(), (value) => _userId.value = value);

    super.onInit();
  }

  Future<void> setToken(String value) async => await _box.write(StorageKey.token.toString(), value);
  Future<void> setUserId(int value) async => await _box.write(StorageKey.userId.toString(), value);

  Future<void> removeToken() async => await _box.remove(StorageKey.token.toString());
  Future<void> removeUserId() async => await _box.remove(StorageKey.userId.toString());

  Future<void> clear() async {
    await _box.erase();
    _token.value = null;
    _userId.value = null;
  }


}
