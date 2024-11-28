import 'package:get/get.dart';

import 'controller.dart';

class MyPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPageController());
  }
}
