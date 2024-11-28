import 'package:cda/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth_interest_selection/page.dart';
import 'controller.dart';
import 'repository.dart';

class AuthNicknamePage extends StatelessWidget {
  AuthNicknamePage({Key? key}) : super(key: key);
  final AuthNicknameController controller = Get.put(AuthNicknameController());

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
              '닉네임을\n입력해주세요.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            TextField(
              onChanged: (value) => controller.nickname.value = value,
              decoration: InputDecoration(
                labelText: '닉네임',
                hintText: '특수문자 제외 한글, 영어, 숫자만 입력해주세요.',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            Spacer(),
            Obx(() => ElevatedButton(
                  onPressed: controller.isNicknameValid
                      ? () {
                          // 다음 페이지로 이동 로직
                          // print('닉네임 입력 완료: ${controller.nickname.value}');
                          AuthService.to
                              .changeNickname(controller.nickname.value);
                          Get.to(() => AuthInterestSelectionPage());
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    // backgroundColor: controller.isNicknameValid
                    //     ? Colors.purple
                    //     : Colors.grey[300],
                    foregroundColor: Colors.white,
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
