import 'package:cda/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

// import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import 'controller.dart';
import 'repository.dart';
import 'widgets/location_filter_bar.dart';

class MapPage extends StatelessWidget {
  MapPage({Key? key}) : super(key: key);

  final List<Map<String, String>> exhibitions = [
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
    final MapController controller = Get.put(MapController());

    return GetBuilder<MapController>(
        init: MapController(),
        builder: (controller) {
          return Stack(
            children: [
              // Positioned.fill(
              //     child: Container(
              //   color: Colors.grey.shade200,
              // )),
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
                    controller.addDefaultMarkers();
                    // controller.loadMarkersWithClustering();
                  },
                  onCameraIdle: () async {
                    // if (controller.mapController == null) return;
                    //
                    // double newZoom = await controller.mapController
                    //     ?.getCameraPosition()
                    //     .then((pos) => pos.zoom) ??
                    //     0.0;
                    // if ((newZoom - controller.currentZoom.value).abs() > 0.1) {
                    //   controller.currentZoom.value = newZoom;
                    //   // await controller.loadMarkersWithClustering();
                    // }
                  },
                  onSelectedIndoorChanged: (selectedIndoor) {
                    print(
                        "@@onSelectedIndoorChanged=${selectedIndoor.toString()}");
                  },
                ),
              ),
              // 하단 목록 부분
              DraggableScrollableSheet(
                controller: controller.sheetDSC,
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
                      physics: BouncingScrollPhysics(),
                      controller: scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    width: 40,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                ),
                              ),
                              LocationFilterBar()
                            ],
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          sliver: SliverList.separated(
                            itemCount: exhibitions.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(); // 아이템 사이의 간격
                            },
                            itemBuilder: (BuildContext context, int index) {
                              final exhibition = exhibitions[index];

                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.exhibitionDetail,arguments: exhibition);
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이미지
          Image.network(
            image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 100,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(width: 16),
          // 전시 정보
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상태
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // 전시 제목
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                // 전시관
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 18),
                // 날짜
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
