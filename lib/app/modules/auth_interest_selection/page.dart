import 'package:cda/app/modules/auth_welcome/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'controller.dart';

class AuthInterestSelectionPage extends StatelessWidget {
  AuthInterestSelectionPage({Key? key}) : super(key: key);
  final AuthInterestSelectionController controller =
      Get.put(AuthInterestSelectionController());

  final List<String> interests = [
    "예술",
    "역사 전시",
    "과학/기술 전시",
    "산업/디자인 전시",
    "특별전시",
    "교육 및 체험 전시",
    "가족/어린이 전시",
    "문화행사"
  ];

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
              '관심있는 전시 분야 3개에\n체크해주세요',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            AlignedGridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              // 4열
              // mainAxisSpacing: 20.0,
              // 세로 간격
              // crossAxisSpacing: 20.0,
              // 가로 간격
              itemCount: interests.length,
              itemBuilder: (context, index) {
                final interest = interests[index];
                return Obx(() {
                  final isSelected =
                      controller.selectedInterests.contains(interest);
                  return CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    value: isSelected,
                    onChanged: (value) => controller.toggleInterest(interest),
                    title: Text(
                      interest,
                      style: TextStyle(
                        fontSize: 12,
                        // color: isSelected ? Colors.purple : Colors.black,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    // activeColor: Colors.purple,
                    checkColor: Colors.white,
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                });
              },
            ),
            Spacer(),
            Obx(() => ElevatedButton(
                  onPressed: controller.isCompleteEnabled
                      ? () {
                          Get.to(()=>AuthWelcomePage());

                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),

                    foregroundColor: Colors.white,
                  ),
                  child: Text('완료하기', style: TextStyle(fontSize: 16)),
                )),
          ],
        ),
      ),
    );
  }
}
