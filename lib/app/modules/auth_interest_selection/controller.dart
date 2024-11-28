import 'package:get/get.dart';

import 'repository.dart';

class AuthInterestSelectionController extends GetxController {
  final AuthInterestSelectionRepository repository = AuthInterestSelectionRepository();

  // 선택된 항목 리스트
  var selectedInterests = <String>[].obs;

  // 최대 선택 가능 개수
  final int maxSelection = 3;

  // 항목 선택/해제 로직
  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest); // 이미 선택된 항목은 제거
    } else {
      if (selectedInterests.length < maxSelection) {
        selectedInterests.add(interest); // 선택된 항목 추가
      } else {
        Get.snackbar(
          '최대 선택',
          '최대 $maxSelection개까지 선택 가능합니다.',
        );
      }
    }
  }

  // 완료 버튼 활성화 여부
  bool get isCompleteEnabled => selectedInterests.length == maxSelection;
}
