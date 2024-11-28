import 'package:get/get.dart';

import 'controller.dart';

class AuthNicknameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthNicknameController());
  }
}
