import 'package:cda/app/modules/auth_verification/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'repository.dart';

class AuthAgreementPage extends StatelessWidget {
  final AuthAgreementController controller = Get.put(AuthAgreementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 32, bottom: 56),
            child: Text(
              '서비스 이용약관을\n확인해주세요.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Obx(() => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                // visualDensity: VisualDensity(horizontal: 0, vertical: -4), // 높이 조정
                dense: true,
                title: Text(
                  '[필수] 만 14세 이상입니다',
                  style: TextStyle(fontSize: 12),
                ),
                value: controller.isOver14Checked.value,
                onChanged: (value) =>
                    controller.isOver14Checked.value = value ?? false,
              )),
          Obx(() => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                // visualDensity: VisualDensity(horizontal: 0, vertical: -4), // 높이 조정
                dense: true,
                title: Row(
                  children: [
                    Text(
                      '[필수] 개인정보 처리방침 동의',
                      style: TextStyle(fontSize: 12),
                    ),
                    TextButton(onPressed: () {}, child: Text('보기')),
                  ],
                ),
                value: controller.isPrivacyPolicyChecked.value,
                onChanged: (value) =>
                    controller.isPrivacyPolicyChecked.value = value ?? false,
              )),
          Obx(() => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                // visualDensity: VisualDensity(horizontal: 0, vertical: -4), // 높이 조정
                dense: true,
                title: Row(
                  children: [
                    Text(
                      '[필수] 서비스 이용약관 동의',
                      style: TextStyle(fontSize: 12),
                    ),
                    TextButton(onPressed: () {}, child: Text('보기')),
                  ],
                ),
                value: controller.isServiceTermsChecked.value,
                onChanged: (value) =>
                    controller.isServiceTermsChecked.value = value ?? false,
              )),
          Obx(() => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                // visualDensity: VisualDensity(horizontal: 0, vertical: -4), // 높이 조정
                dense: true,
                title: Row(
                  children: [
                    Text(
                      '[선택] 할인 쿠폰, 프로모션 등 광고 수신동의',
                      style: TextStyle(fontSize: 12),
                    ),
                    TextButton(onPressed: () {}, child: Text('보기')),
                  ],
                ),
                value: controller.isPromotionChecked.value,
                onChanged: (value) =>
                    controller.isPromotionChecked.value = value ?? false,
              )),
          Spacer(),
          Obx(() => Padding(
                padding: const EdgeInsets.all(20.0),
                child: FilledButton(
                  onPressed: controller.isAllRequiredChecked
                      ? () {
                          Get.to(()=>AuthVerificationPage());
                        }
                      : null, // 비활성화
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: controller.isAllRequiredChecked
                    //     ? Colors.blue
                    //     : Colors.grey[300],
                    foregroundColor: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      '동의하고 진행하기',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
