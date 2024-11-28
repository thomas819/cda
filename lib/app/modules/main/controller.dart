import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'repository.dart';

class MainController extends GetxController {
  final MainRepository repository = MainRepository();

  RxInt currentIndex = 0.obs;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  changePageIndex(int index) {
    if (pageController.hasClients) {
      currentIndex.value = index;
      pageController.jumpToPage(index);
    }
  }
}
