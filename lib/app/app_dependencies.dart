import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../core/network/api_client.dart';
import '../core/services/session_service.dart';
import '../core/services/storage_service.dart';
import '../data/repositories/auth_repository.dart';

/// Registers app-wide singletons before the first frame.
abstract final class AppDependencies {
  static Future<void> init() async {
    await GetStorage.init();
    final storage = Get.put(StorageService(), permanent: true);
    Get.put(SessionService(storage).init(), permanent: true);
    Get.put(ApiClient(), permanent: true);
    Get.put<AuthRepository>(AuthRepositoryImpl(Get.find()), permanent: true);
  }
}
