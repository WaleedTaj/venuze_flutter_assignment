import 'package:get/get.dart';

import '../bookings/bookings_view_model.dart';
import '../profile/profile_view_model.dart';
import 'main_view_model.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(MainViewModel.new);
    Get.lazyPut(() => BookingsViewModel(session: Get.find()));
    Get.lazyPut(() => ProfileViewModel(session: Get.find()));
  }
}
