import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';

import 'repository.dart';

class ExhibitionDetailController extends GetxController {
  final ExhibitionDetailRepository repository = ExhibitionDetailRepository();
  Map<String, String> exhibition = {};
  NaverMapController? mapController;

  @override
  void onInit() {
    exhibition = Get.arguments;
    super.onInit();
  }

  Future<void> addDefaultMarkers() async {
    var marker = NMarker(
      id: '1',
      position: NLatLng(
        37.5665,
        126.9780, // 서울 시청
      ),
    );
    await mapController?.addOverlayAll({marker});
  }
}
