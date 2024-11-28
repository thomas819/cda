import 'package:get/get.dart';

import 'controller.dart';

class AuthWelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthWelcomeController());
  }
}
