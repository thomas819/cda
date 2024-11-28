import 'package:get/get.dart';

import 'repository.dart';

class AuthNicknameController extends GetxController {
  final AuthNicknameRepository repository = AuthNicknameRepository();
  var nickname = ''.obs; // 닉네임 상태 변수

  // 닉네임 유효성 검사
  bool get isNicknameValid =>
      nickname.value.isNotEmpty &&
          RegExp(r"^[가-힣a-zA-Z0-9]+$").hasMatch(nickname.value); // 특수문자 제외
}
