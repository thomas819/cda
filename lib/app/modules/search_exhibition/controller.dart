import 'package:get/get.dart';

import 'repository.dart';

class SearchExhibitionController extends GetxController {
  final SearchExhibitionRepository repository = SearchExhibitionRepository();

  RxString searchText = ''.obs;
  RxInt selectedTab = 0.obs;

  List<Map<String, String>> exhibitions = List.generate(
      5,
          (index) => {
        'title': '전시명 $index',
        'location': '전시관 $index',
      });

  List<Map<String, String>> exhibitionHalls = List.generate(
      5,
          (index) => {
        'title': '[전시관명] 전시명 $index',
      });

  List<Map<String, String>> users = List.generate(
      5,
          (index) => {
        'username': '유저명 $index',
      });

  void updateSearch(String value) {
    searchText.value = value;
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }
}
