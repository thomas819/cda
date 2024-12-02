import 'package:cda/app/modules/map/widgets/location_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'controller.dart';

class MapPage extends StatelessWidget {
  MapPage({Key? key}) : super(key: key);

  final List<Map<String, String>> exhibitions = [
    {
      'title': '미래를 그리다',
      'location': '서울 현대미술관',
      'date': '2024.09.01 - 2024.12.31',
      'status': '전시중',
      'description': '현대 사회와 미래 기술을 예술로 표현한 전시입니다.',
      'image': 'https://www.mmca.go.kr/upload/exhibition/2023/08/2023082505420682414560.jpg',
    },
    {
      'title': '빛과 그림자',
      'location': '부산 아트센터',
      'date': '2024.10.01 - 2025.01.15',
      'status': '전시중',
      'description': '빛과 어둠의 조화를 통해 감각을 일깨우는 예술 전시입니다.',
      'image': 'https://www.kumc.or.kr/seasonPress/KUMM09/img_sub/KS46_img11.jpg',
    },
    {
      'title': '자연의 소리',
      'location': '인천 문화예술관',
      'date': '2024.11.01 - 2025.02.01',
      'status': '전시중',
      'description': '자연에서 영감을 얻은 소리와 이미지를 결합한 작품 전시입니다.',
      'image': 'https://www.noblesse.com/shop/data/m/editor_new/2020/09/09/3cbef4f7922ef6b305.jpg',
    },
    {
      'title': '우주를 보다',
      'location': '대전 과학관',
      'date': '2024.12.01 - 2025.03.01',
      'status': '전시중',
      'description': '우주의 신비와 인간의 탐구를 주제로 한 과학 예술 전시입니다.',
      'image': 'https://museumnews.kr/wp-content/uploads/2018/01/%EB%91%90%EB%B2%88%EC%A7%B8%ED%92%8D%EA%B2%BD-%EC%A0%84%EC%8B%9C-%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg',
    },
    {
      'title': '전통의 미학',
      'location': '광주 전통문화센터',
      'date': '2024.09.15 - 2024.12.15',
      'status': '전시중',
      'description': '한국 전통의 아름다움을 현대적으로 재해석한 전시입니다.',
      'image': 'https://cdn.mhns.co.kr/news/photo/202109/511451_618343_3128.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
      init: MapController(),
        builder: (controller) {
          return Stack(
            children: [
              Positioned.fill(
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
                  },
                ),
              ),
              // DraggableScrollableSheet
              DraggableScrollableSheet(
                // key: GlobalKey(),
                snap: true,
                initialChildSize: 0.3,
                minChildSize: 0.3,
                maxChildSize: 0.9,
                builder: (context, scrollController) {
                  controller.sheetScrollController = scrollController;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              LocationFilterBar(),
                            ],
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              final exhibition = exhibitions[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed('/exhibitionDetail', arguments: exhibition);
                                },
                                child: buildExhibitionCard(
                                  image: exhibition['image']!,
                                  title: exhibition['title']!,
                                  location: exhibition['location']!,
                                  date: exhibition['date']!,
                                  status: exhibition['status']!,
                                ),
                              );
                            },
                            childCount: exhibitions.length,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        });
  }

  Widget buildExhibitionCard({
    required String image,
    required String title,
    required String location,
    required String date,
    required String status,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(image, width: 100, height: 100, fit: BoxFit.cover),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(status, style: TextStyle(fontSize: 12)),
                Text(title, style: TextStyle(fontSize: 16)),
                Text(location, style: TextStyle(fontSize: 14)),
                Text(date, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
