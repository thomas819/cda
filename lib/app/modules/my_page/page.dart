import 'package:cda/app/data/services/auth_service.dart';
import 'package:cda/core/values/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '마이페이지',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              // 설정 페이지로 이동
              print('설정 버튼 클릭');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 프로필 섹션
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // 프로필 이미지
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                SizedBox(width: 16),
                // 이름과 카테고리
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AuthService.to.nickname(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: [
                          Text('#카테고리'),
                          Text('#카테고리'),
                          Text('#카테고리'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1, height: 1),
          // 리스트 섹션
          Expanded(
            child: ListView(
              children: [
                buildListTile(
                  context,
                  icon: AppIcons.favoriteOutlinedIcon,
                  title: '좋아요',
                  count: 104,
                  onTap: () => print('좋아요 클릭'),
                ),
                buildListTile(
                  context,
                  icon: AppIcons.gpsIcon,
                  title: '입장',
                  count: 32,
                  onTap: () => print('입장 클릭'),
                ),
                buildListTile(
                  context,
                  icon: AppIcons.myReviewIcon,
                  title: '내 리뷰',
                  count: 64,
                  onTap: () => print('내 리뷰 클릭'),
                ),
                buildListTile(
                  context,
                  icon: AppIcons.userCheckIcon,
                  title: '팔로잉',
                  count: 24,
                  onTap: () => print('팔로잉 클릭'),
                ),
                buildListTile(
                  context,
                  icon: AppIcons.peopleIcon,
                  title: '팔로워',
                  count: 16,
                  onTap: () => print('팔로워 클릭'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(BuildContext context,
      {required String icon,
      required String title,
      required int count,
      required VoidCallback onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      leading: SvgPicture.asset(icon),
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(title, style: TextStyle(fontSize: 16)),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$count', style: TextStyle(fontSize: 16)),
          SizedBox(
            width: 8,
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }
}
