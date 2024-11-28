import 'package:get/get.dart';

import 'controller.dart';

class ExhibitionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExhibitionDetailController());
  }
}
