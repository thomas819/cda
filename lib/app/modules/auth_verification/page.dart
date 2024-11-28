import 'package:cda/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'repository.dart';

class AuthVerificationPage extends StatelessWidget {
  final AuthVerificationController controller =
  Get.put(AuthVerificationController());

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '반가워요!\n본인 인증을 해주세요.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            Obx(() {
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      onChanged: (value) =>
                      controller.phoneNumber.value = value,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: '전화번호',
                        hintText: "'-' 없이 숫자만 입력해주세요.",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.isPhoneNumberValid
                          ? controller.sendVerificationCode
                          : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(44),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        '인증번호 발송',
                      ),
                    ),
                  ),
                ],
              );
            }),
            SizedBox(height: 24),
            Obx(() {
              // 인증 번호 발송 후 인증 번호 입력 필드 표시
              return controller.isVerificationSent.value
                  ? TextField(
                onChanged: (value) =>
                controller.verificationCode.value = value,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: '인증 번호',
                  hintText: '인증번호 입력',
                ),
              )
                  : SizedBox.shrink(); // 인증 번호 발송 전에는 빈 공간으로 처리
            }),
            Spacer(),
            Obx(() => ElevatedButton(
              onPressed: controller.verificationCode.value.isNotEmpty
                  ? controller.verifyAndProceed
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                // backgroundColor:
                // controller.verificationCode.value.isNotEmpty
                //     ? Colors.purple
                //     : Colors.grey[300],
              ),
              child: Text(
                '다음으로',
                style: TextStyle(fontSize: 16),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
