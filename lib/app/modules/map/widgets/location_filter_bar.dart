import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationFilterBar extends StatelessWidget {
  final RxString selectedCity = '서울'.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => GestureDetector(
                onTap: () {
                  // 도시 선택 드롭다운 로직
                  _showCityPicker(context);
                },
                child: Row(
                  children: [
                    Text(
                      selectedCity.value,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              )),
          IconButton(
            onPressed: () {
              // 필터 버튼 클릭 로직
              _showFilterDialog(context);
            },
            icon: Icon(Icons.tune), // 필터 아이콘
          ),
        ],
      ),
    );
  }

  // 도시 선택 드롭다운
  void _showCityPicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return ListView(
          children: ['서울', '부산', '대구', '인천', '광주']
              .map((city) => ListTile(
                    title: Text(city),
                    onTap: () {
                      selectedCity.value = city; // 도시 선택 변경
                      Navigator.pop(context);
                    },
                  ))
              .toList(),
        );
      },
    );
  }

  // 필터 다이얼로그
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('필터 설정'),
          content: Text('여기에 필터 옵션을 추가하세요.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }
}
