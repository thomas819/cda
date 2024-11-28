import 'package:cda/app/modules/exhibition/controller.dart';
import 'package:cda/app/modules/exhibition_detail/controller.dart';
import 'package:cda/app/widgets/review_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';

class ExhibitionDetailPage extends GetView<ExhibitionDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 상단 이미지 및 기본 정보
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 4 / 5,
                  child: Image.network(
                    controller.exhibition['image']!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 16,
                  right: 16, // Constrain the width to match the screen
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Text(
                            '전시중',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '전시명',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '전시관',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('카테고리',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
                                SizedBox(height: 4),
                                Text(
                                  '#카테고리명',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('기간',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
                                SizedBox(height: 4),
                                Text('2024.09.24~2024.12.31',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('비용',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
                                SizedBox(height: 4),
                                Text('무료',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),

            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                controller.exhibition['description']!,
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              ),
            ),
            Divider(thickness: 1),
            // 전시관명 섹션
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.exhibition['title']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('강남구 수서동 520, 공마을 공원'),
                  SizedBox(height: 16),
                  Container(
                    height: 200,
                    child: NaverMap(
                      key: UniqueKey(),
                      options: const NaverMapViewOptions(
                        indoorEnable: true,
                        locationButtonEnable: false,
                        tiltGesturesEnable: false,
                        rotationGesturesEnable: false,
                      ),
                      onMapReady: (NaverMapController mapController) {
                        controller.mapController = mapController;
                        controller.addDefaultMarkers();
                      },
                      onSelectedIndoorChanged: (selectedIndoor) {
                        print(
                            "@@onSelectedIndoorChanged=${selectedIndoor.toString()}");
                      },
                    )
                  ),
                ],
              ),
            ),
            Divider(thickness: 1),
            // 리뷰 섹션
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '리뷰',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3, // 리뷰 아이템 개수
                  itemBuilder: (context, index) {
                    return ReviewItem(
                      username: 'user',
                      artworkImage: 'https://i.ytimg.com/vi/QK_KJMp1Lhk/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AH-CYAC0AWKAgwIABABGGUgYShbMA8=&rs=AOn4CLDNND6_ZdPBhzhYeP7ybYLTiLC6yQ',
                      exhibitionImage: 'https://dimg.donga.com/wps/NEWS/IMAGE/2020/12/01/104228292.2.jpg',
                      exhibitionTitle: '예술 탐험展',
                      likes: 12,
                      comments: 10,
                      content: '다양한 장르의 작품들이 어우러진 전시였습니다. 작품 간의 연결성이 돋보였습니다.',
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  print('리뷰 남기기 클릭');
                },
                child: Text('리뷰 남기기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
