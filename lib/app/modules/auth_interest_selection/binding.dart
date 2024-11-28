import 'package:get/get.dart';

import 'controller.dart';

class AuthInterestSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthInterestSelectionController());
  }
}
