import 'package:cda/app/modules/auth_nickname/page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/values/consts.dart';
import '../../../core/values/keys.dart';
import '../../data/enum/phone_status.dart';
import 'repository.dart';

class AuthVerificationController extends GetxController {
  final AuthVerificationRepository repository = AuthVerificationRepository();

  var phoneNumber = ''.obs;
  var verificationCode = ''.obs;
  var isVerificationSent = false.obs; // 인증 번호 발송 여부 상태 추가

  RxnInt resendToken = RxnInt();
  Rxn<PhoneStatus> phoneStatus = Rxn<PhoneStatus>();
  RxnString phoneVerificationId = RxnString();
  RxBool isVerifyOpened = false.obs;
  RxnString phoneVerificationError = RxnString();

  TextEditingController phoneTEC = TextEditingController();
  TextEditingController phoneVerifyTEC = TextEditingController();
  FocusNode phoneVerifyFN = FocusNode();
  final phoneVerifyFormKey = GlobalKey<FormState>();

  phoneVerify() {
    phoneVerifyTEC.clear();

    isVerifyOpened.value = true;

    phoneAuth(phoneNumber.value);

    // startTimer();
    phoneVerifyFN.requestFocus();
  }

  phoneAuth(phoneNum) async {
    FirebaseAuth.instance.verifyPhoneNumber(
      timeout: Duration(seconds: 10),
      forceResendingToken: resendToken.value,
      phoneNumber: '+82 $phoneNum',
      codeSent: (String verificationId, int? resendToken) {
        //Firebase에서 기기로 코드가 전송된 경우를 처리하며 사용자에게 코드를 입력하라는 메시지를 표시하는 데 사용됩니다.
        //Firebase가 기기에 SMS 코드를 전송하면 이 핸들러가 verificationId 및 resendToken으로 트리거됩니다
        // (resendToken은 Android 기기에서만 지원되며 iOS 기기는 항상 null 값을 반환합니다).
        phoneVerificationId.value = verificationId;
        this.resendToken.value = resendToken;
        print('@@codeSent');
        phoneStatus.value = PhoneStatus.send;
      },
      verificationFailed: (FirebaseAuthException e) {
        //잘못된 전화번호나 SMS 할당량 초과 여부 등의 실패 이벤트를 처리합니다.
        // String error = e.code == 'invalid-phone-number'
        //     ? 'invalid_phone_number'.tr /*"유효하지 않은 번호입니다. 다시 입력해주세요."*/
        //     : 'unable_login'.tr /*"로그인 할 수 없습니다. 다시 시도 해주세요."*/;
        print('@@verificationFailed=${e.code}');
        phoneStatus.value = PhoneStatus.error;
      },
      verificationCompleted: (PhoneAuthCredential credential) async {
        //Android 기기의 SMS 코드 자동 처리.
        signInWithPhoneNumber(authCredential: credential);
        print('@@verificationCompleted');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        //자동 SMS 코드 처리에 실패한 경우 시간 초과를 처리합니다 for aos.
        print('@@codeAutoRetrievalTimeout');
        phoneVerificationId.value = verificationId;
        // phoneStatus.value = PhoneStatus.error;
      },
    );
  }

  Future<bool> signInWithPhoneNumber(
      {String? verificationId,
        String? smsCode,
        PhoneAuthCredential? authCredential}) async {
    PhoneAuthCredential credential = authCredential ??
        PhoneAuthProvider.credential(
          verificationId: verificationId!,
          smsCode: smsCode!,
        );
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        phoneStatus.value = PhoneStatus.verified; // 인증 성공 시 상태 업데이트
        isVerifyOpened.value = false;
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException=${e.code}');
      phoneStatus.value = PhoneStatus.error; // 인증 실패 시 상태 업데이트
      phoneVerificationError.value = '인증 실패. 다시 시도해주세요.';
      return false;
    }
    return false;
  }


  void sendVerificationCode() {
    // 인증 번호 발송 로직
    if (isPhoneNumberValid) {
      phoneVerify();
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
