import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

// import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';

import 'repository.dart';

class MapController extends GetxController {
  final MapRepository repository = MapRepository();

  // 검색어 상태
  var searchQuery = ''.obs;

  // 현재 선택된 위치
  var selectedLocation = '서울'.obs;

  // NaverMapController? mapController;
  Rx<double> currentZoom = 10.0.obs; // 현재 줌 레벨 상태 저장
  ScrollController sheetScrollController = ScrollController();
  NaverMapController? mapController;
  RxList<NMarker> markers = <NMarker>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Future<void> addDefaultMarkers() async {
    markers.assignAll([
      NMarker(
        id: '1',
        position: NLatLng(
          37.5665,
          126.9780, // 서울 시청
        ),
      ),
      NMarker(
        id: '2',
        position: NLatLng(
          37.5700,
          126.9830, // 광화문
        ),
      ),
      NMarker(
        id: '3',
        position: NLatLng(
          37.5642,
          126.9770, // 남대문
        ),
      ),
      NMarker(
        id: '4',
        position: NLatLng(
          37.5580,
          126.9784, // 명동
        ),
      ),
      NMarker(
        id: '5',
        position: NLatLng(
          37.5771,
          126.9895, // 북촌 한옥마을
        ),
      ),
    ]);
    await mapController?.addOverlayAll({...markers});
  }

  // 전시회 목록 데이터
  var exhibitions = [
    {'title': '전시회 1', 'location': '서울 전시관', 'date': '2024.09.24 - 2024.12.31'},
    {'title': '전시회 2', 'location': '강남 전시관', 'date': '2024.10.01 - 2024.12.31'},
  ].obs;

  // 검색 필터 적용
  void search(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      // 검색어가 없으면 초기 상태 유지
      exhibitions.assignAll([
        {
          'title': '전시회 1',
          'location': '서울 전시관',
          'date': '2024.09.24 - 2024.12.31'
        },
        {
          'title': '전시회 2',
          'location': '강남 전시관',
          'date': '2024.10.01 - 2024.12.31'
        },
      ]);
    } else {
      // 검색 결과 필터링
      exhibitions.assignAll(exhibitions.where((exhibition) {
        return exhibition['title']!.contains(query) ||
            exhibition['location']!.contains(query);
      }).toList());
    }
  }
}
