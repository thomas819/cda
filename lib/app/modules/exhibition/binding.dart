import 'package:get/get.dart';

import 'controller.dart';

class ExhibitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExhibitionController());
  }
}
