import 'package:cda/app/modules/auth_nickname/page.dart';
import 'package:get/get.dart';

import 'repository.dart';

class AuthVerificationController extends GetxController {
  final AuthVerificationRepository repository = AuthVerificationRepository();

  var phoneNumber = ''.obs;
  var verificationCode = ''.obs;
  var isVerificationSent = false.obs; // 인증 번호 발송 여부 상태 추가

  void sendVerificationCode() {
    // 인증 번호 발송 로직
    if (isPhoneNumberValid) {
      print('Sending verification code to ${phoneNumber.value}');
      isVerificationSent.value = true; // 인증 번호 발송 상태를 true로 업데이트
    } else {
      Get.snackbar('Error', 'Invalid phone number');
    }
  }

  void verifyAndProceed() {
    // 인증 번호 확인 및 다음 단계 로직
    if (verificationCode.value.isNotEmpty) {
      // print('Verification code entered: ${verificationCode.value}');
      Get.to(()=>AuthNicknamePage());
    } else {
      Get.snackbar('Error', 'Please enter the verification code');
    }
  }

  bool get isPhoneNumberValid =>
      phoneNumber.value.length == 10 || phoneNumber.value.length == 11;
}
