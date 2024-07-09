import 'package:get_storage/get_storage.dart';

class LocalServiceHelper {
  final _storage = GetStorage();

  Future<void> initializer() async {
    await GetStorage.init();
  }

  Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  T? read<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> clear() async {
    await _storage.erase();
  }
}
