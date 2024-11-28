import 'package:get/get.dart';

import 'repository.dart';

class AuthAgreementController extends GetxController {
  final AuthAgreementRepository repository = AuthAgreementRepository();
  var isOver14Checked = false.obs;
  var isPrivacyPolicyChecked = false.obs;
  var isServiceTermsChecked = false.obs;
  var isPromotionChecked = false.obs;

  // 모든 필수 항목이 체크되었는지 확인
  bool get isAllRequiredChecked =>
      isOver14Checked.value && isPrivacyPolicyChecked.value && isServiceTermsChecked.value;
}
