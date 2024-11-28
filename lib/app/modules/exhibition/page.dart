import 'package:cda/app/modules/exhibition/controller.dart';
import 'package:cda/app/modules/search_exhibition/page.dart';
import 'package:cda/core/values/icons.dart';
import 'package:cda/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ExhibitionPage extends StatelessWidget {
  final List<Map<String, String>> ongoingExhibitions = [
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

  final List<Map<String, String>> featuredExhibitions = [
    {
      'title': '특별 기획전: 색의 향연',
      'location': '특별전시관 1',
      'date': '2024.10.01 - 2025.01.01',
      'status': '전시중',
      'description': '다양한 색감의 현대 예술 작품을 감상할 수 있는 전시입니다.',
      'image': 'https://magazine.brique.co/wp-content/uploads/2022/05/%EC%A0%84%EC%8B%9C%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg',
    },
    {
      'title': '특별 기획전: 시간의 흐름',
      'location': '특별전시관 2',
      'date': '2024.11.01 - 2025.02.01',
      'status': '전시중',
      'description': '시간과 기억을 주제로 한 작품들이 전시됩니다.',
      'image': 'https://cdn.gukjenews.com/news/photo/202008/2056818_2054109_124.jpg',
    },
    {
      'title': '특별 기획전: 상상과 현실',
      'location': '특별전시관 3',
      'date': '2024.12.01 - 2025.03.01',
      'status': '전시중',
      'description': '상상 속 세계를 현실화한 독창적인 작품들을 만나보세요.',
      'image': 'https://img9.yna.co.kr/photo/yna/YH/2017/07/25/PYH2017072529480006100_P4.jpg',
    },
    {
      'title': '특별 기획전: 도시의 예술',
      'location': '특별전시관 4',
      'date': '2024.10.15 - 2025.01.15',
      'status': '전시중',
      'description': '도시의 일상에서 예술을 발견할 수 있는 특별 전시입니다.',
      'image': 'https://dimg.donga.com/wps/NEWS/IMAGE/2020/12/01/104228292.2.jpg',
    },
    {
      'title': '특별 기획전: 자연과 인간',
      'location': '특별전시관 5',
      'date': '2024.11.15 - 2025.02.15',
      'status': '전시중',
      'description': '자연과 인간의 조화로운 관계를 탐구한 예술 작품 전시입니다.',
      'image': 'https://ojsfile.ohmynews.com/STD_IMG_FILE/2022/0314/IE002956567_STD.JPG',
    },
  ];

  final List<Map<String, String>> upcomingExhibitions = [
    {
      'title': '다가올 미래',
      'location': '서울 미래박물관',
      'date': '2025.01.01 - 2025.06.01',
      'status': '예정',
      'description': '미래 기술과 사회를 예술적으로 조명하는 특별 전시입니다.',
      'image': 'https://contents.sixshop.com/thumbnails/uploadedFiles/23433/product/image_1599637122958_750.jpg',
    },
    {
      'title': '역사의 흔적',
      'location': '부산 역사박물관',
      'date': '2025.02.01 - 2025.07.01',
      'status': '예정',
      'description': '역사적인 사건과 유물을 재해석한 예술 전시입니다.',
      'image': 'https://contents.sixshop.com/thumbnails/uploadedFiles/23433/product/image_1505370672535_750.jpg',
    },
    {
      'title': '자연과의 대화',
      'location': '대구 자연사박물관',
      'date': '2025.03.01 - 2025.08.01',
      'status': '예정',
      'description': '자연과의 대화를 통해 환경 문제를 조명한 작품들입니다.',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmC4_PVrnIBZMVU05xPqkL4_qscv7AQWW8Cg&s',
    },
    {
      'title': '예술과 철학',
      'location': '광주 철학박물관',
      'date': '2025.04.01 - 2025.09.01',
      'status': '예정',
      'description': '예술과 철학의 만남을 주제로 한 심도 깊은 전시입니다.',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYqf9H8eLd_gfvIewNfdhhc4fC2Tc0inPvdA&s',
    },
    {
      'title': '음악과 미술의 만남',
      'location': '인천 예술의전당',
      'date': '2025.05.01 - 2025.10.01',
      'status': '예정',
      'description': '음악과 미술이 결합된 새로운 형태의 예술 전시입니다.',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAYYGyE0TkWGBUGDWlFeu5YQ0k2BfPbZvMTg&s',
    },
  ];

  Widget buildCategory(String title, List<Map<String, String>> exhibitions) {
    return GetBuilder<ExhibitionController>(
        init: ExhibitionController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        print('$title 전체보기 클릭됨');
                      },
                      child: Row(
                        children: [
                          Text(
                            '전체보기',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_right_alt, color: Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: exhibitions.length,
                  itemBuilder: (context, index) {
                    final exhibition = exhibitions[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.exhibitionDetail,arguments: exhibition);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                AspectRatio(
                                  aspectRatio: 4 / 5,
                                  child: Image.network(
                                    exhibition['image']!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        Container(
                                          color: Colors.grey.shade200,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Card(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16)),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        exhibition['status']!,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // Expanded(
                            //   flex: 6,
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       color: Colors.grey.shade200,
                            //       borderRadius: BorderRadius.circular(8),
                            //     ),
                            //     child: Align(
                            //       alignment: Alignment.topRight,
                            //       child: Container(
                            //         margin: EdgeInsets.all(6),
                            //         padding: EdgeInsets.symmetric(
                            //             horizontal: 6, vertical: 4),
                            //         decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           border: Border.all(color: Colors.black),
                            //           borderRadius: BorderRadius.circular(16),
                            //         ),
                            //         child: Text(
                            //           exhibition['status']!,
                            //           style: TextStyle(
                            //             fontSize: 12,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 8),
                            Text(
                              exhibition['title']!,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Expanded(
                              flex: 1,
                              child: Text(
                                exhibition['description']!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('전시 목록'),
        actions: [
          IconButton(
            onPressed: () {
              // Get.to(()=>SearchExhibitionPage());
              Get.toNamed(Routes.searchExhibition);
            },
            icon: SvgPicture.asset(AppIcons.searchIcon),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildCategory('진행중인 전시', ongoingExhibitions),
            buildCategory('특정 전시관의 전시', featuredExhibitions),
            buildCategory('예정된 전시', upcomingExhibitions),
          ],
        ),
      ),
    );
  }
}
