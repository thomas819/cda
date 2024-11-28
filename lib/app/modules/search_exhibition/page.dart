import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'repository.dart';

class SearchExhibitionPage extends GetView<SearchExhibitionController> {
  const SearchExhibitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.updateSearch,
          decoration: InputDecoration(
            hintText: '전시명, 전시관, 유저명',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller.updateSearch('');
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          DefaultTabController(
            length: 3,
            child: TabBar(
              onTap: controller.changeTab,
              tabs: [
                Tab(text: '전시'),
                Tab(text: '전시관'),
                Tab(text: '유저'),
              ],
            ),
          ),
          Obx(() {
            switch (controller.selectedTab.value) {
              case 0:
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.exhibitions.length,
                    itemBuilder: (context, index) {
                      final item = controller.exhibitions[index];
                      return ListTile(
                        leading: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Container(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        title: Text(item['title']!),
                        subtitle: Text(item['location']!),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {
                            print('좋아요 클릭');
                          },
                        ),
                      );
                    },
                  ),
                );
              case 1:
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.exhibitionHalls.length,
                    itemBuilder: (context, index) {
                      final item = controller.exhibitionHalls[index];
                      return ListTile(
                        title: Text(item['title']!),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      );
                    },
                  ),
                );
              case 2:
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) {
                      final item = controller.users[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          child: Icon(Icons.person, color: Colors.grey),
                        ),
                        title: Text(item['username']!),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: () {
                            print('유저 팔로우/언팔로우');
                          },
                        ),
                      );
                    },
                  ),
                );
              default:
                return Center(child: Text('선택된 데이터가 없습니다.'));
            }
          }),
        ],
      ),
    );

  }
}
