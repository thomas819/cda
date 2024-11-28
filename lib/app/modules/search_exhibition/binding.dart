import 'package:get/get.dart';

import 'controller.dart';

class SearchExhibitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchExhibitionController());
  }
}
