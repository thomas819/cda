import 'package:cda/app/modules/chat/page.dart';
import 'package:cda/app/modules/map/page.dart';
import 'package:cda/app/modules/my_page/page.dart';
import 'package:cda/app/modules/review/page.dart';
import 'package:cda/app/modules/store/page.dart';
import 'package:cda/core/utils/extensions/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/values/icons.dart';
import '../exhibition/page.dart';
import 'controller.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => _bottomNavigationBar(context)),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          MapPage().keepPage,
          ExhibitionPage().keepPage,
          ChatPage().keepPage,
          StorePage().keepPage,
          ReviewPage().keepPage,
          MyPage().keepPage,
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 20,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        // unselectedLabelStyle: TextStyle(color: Colors.red),
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColors.primaryColor,
        showSelectedLabels: false,
        // 선택된 항목의 라벨 숨기기
        showUnselectedLabels: false,
        // 선택되지 않은 항목의 라벨 숨기기
        onTap: (value) {
          controller.changePageIndex(value);
        },
        items: [
          // BottomNavigationBarItem(
          //     icon: _buildSvgIcon(AppIcons.vipLoungeIcon, 0), label: 'VIP라운지'),
          BottomNavigationBarItem(
              icon: _buildSvgIcon(AppIcons.mapIcon, 0), label: ''),
          BottomNavigationBarItem(
              icon: _buildSvgIcon(AppIcons.locationIcon, 1), label: ''),
          BottomNavigationBarItem(
              icon: _buildSvgIcon(AppIcons.chatIcon, 2), label: ''),
          BottomNavigationBarItem(
              icon: _buildSvgIcon(AppIcons.storeIcon, 3), label: ''),
          BottomNavigationBarItem(
              icon: _buildSvgIcon(AppIcons.reviewIcon, 4), label: ''),
          BottomNavigationBarItem(
              icon: _buildSvgIcon(AppIcons.profileIcon, 5), label: ''),
        ]);
  }

  Widget _buildSvgIcon(String assetName, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: SvgPicture.asset(
        assetName,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
            controller.currentIndex.value == index
                ? AppColors.primaryColor
                : Colors.grey,
            BlendMode.srcIn),
      ),
    );
  }
}
