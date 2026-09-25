  import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  static const _sessionKey = 'session';

  final _box = GetStorage();

  Map<String, dynamic>? readSession() {
    final raw = _box.read(_sessionKey);
    return raw is Map ? Map<String, dynamic>.from(raw) : null;
  }

  Future<void> writeSession(Map<String, dynamic> json) =>
      _box.write(_sessionKey, json);

  Future<void> clearSession() => _box.remove(_sessionKey);
}
