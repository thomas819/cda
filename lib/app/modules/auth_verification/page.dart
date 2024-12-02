import 'package:cda/app/data/enum/phone_status.dart';
import 'package:cda/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                      controller: controller.phoneTEC,
                      onChanged: (value) =>
                          controller.phoneNumber.value = value,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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

            Obx(() => Visibility(
                  visible: controller.isVerifyOpened.value ||
                      controller.phoneStatus.value == PhoneStatus.send ||
                      controller.phoneStatus.value == PhoneStatus.error,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Form(
                          key: controller.phoneVerifyFormKey,
                          child: TextFormField(
                            focusNode: controller.phoneVerifyFN,
                            controller: controller.phoneVerifyTEC,
                            onChanged: (value) {
                              controller.verificationCode.value = value;
                              if (controller.phoneVerifyFormKey.currentState!
                                  .validate()) {
                                controller.phoneVerifyFormKey.currentState!
                                    .validate();
                              }
                            },
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: '',
                              errorText: controller.phoneVerificationError.value,
                              labelText: '인증 번호',
                              hintText: '인증번호 입력',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '값을 입력해주세요';
                              }
                              if (value.length < 6) {
                                return '인증코드는 6자입니다';
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (controller.phoneVerifyFormKey.currentState!
                                .validate()) {
                              bool result =
                                  await controller.signInWithPhoneNumber(
                                      verificationId: controller
                                              .phoneVerificationId.value ??
                                          '',
                                      smsCode: controller.phoneVerifyTEC.text);
                              if (result) {
                                controller.phoneVerifyFN.unfocus();
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(44),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            '인증확인',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            // Obx(() {
            //   // 인증 번호 발송 후 인증 번호 입력 필드 표시
            //   return controller.isVerifyOpened.value ||
            //       controller.phoneStatus.value == PhoneStatus.send ||
            //       controller.phoneStatus.value == PhoneStatus.error
            //       ? TextField(
            //     focusNode: controller.phoneVerifyFN,
            //     controller: controller.phoneVerifyTEC,
            //     onChanged: (value) =>
            //     controller.verificationCode.value = value,
            //     keyboardType: TextInputType.number,
            //     decoration: InputDecoration(
            //       labelText: '인증 번호',
            //       hintText: '인증번호 입력',
            //     ),
            //   )
            //       : SizedBox.shrink(); // 인증 번호 발송 전에는 빈 공간으로 처리
            // }),
            Spacer(),
            Obx(() => ElevatedButton(
                  onPressed:
                      controller.phoneStatus.value == PhoneStatus.verified
                          ? controller.verifyAndProceed
                          : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
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
