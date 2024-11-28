import 'package:get/get.dart';

import 'controller.dart';

class AuthVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthVerificationController());
  }
}
