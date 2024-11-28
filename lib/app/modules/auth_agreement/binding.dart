import 'package:get/get.dart';

import 'controller.dart';

class AuthAgreementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthAgreementController());
  }
}
