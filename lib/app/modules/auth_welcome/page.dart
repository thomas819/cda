import 'package:cda/app/data/services/auth_service.dart';
import 'package:cda/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'repository.dart';

class AuthWelcomePage extends StatelessWidget {
  const AuthWelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthWelcomeController controller = Get.put(AuthWelcomeController());

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            AuthService.to.changeIsLogged(true);
            Get.offAllNamed(Routes.main);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            // backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            '홈으로',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '닉네임 ${AuthService.to.nickname()}님 반가워요!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              '지금 바로 관심있는 전시를\n감상하러 가보세요!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
