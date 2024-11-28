import 'package:cda/app/modules/auth_agreement/binding.dart';
import 'package:cda/app/modules/auth_agreement/page.dart';
import 'package:cda/app/modules/exhibition_detail/binding.dart';
import 'package:cda/app/modules/exhibition_detail/page.dart';
import 'package:cda/app/modules/search_exhibition/binding.dart';
import 'package:cda/app/modules/search_exhibition/page.dart';
import 'package:cda/core/middleware/auth_guard.dart';
import 'package:get/get.dart';

import '../app/modules/main/binding.dart';
import '../app/modules/main/page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.main,
        page: () => MainPage(),
        binding: MainBinding(),
        middlewares: [AuthGuard()]),
    GetPage(
      name: Routes.authAgreement,
      page: () => AuthAgreementPage(),
      binding: AuthAgreementBinding(),
    ),
    GetPage(
      name: Routes.searchExhibition,
      page: () => SearchExhibitionPage(),
      binding: SearchExhibitionBinding(),
    ),
    GetPage(
      name: Routes.exhibitionDetail,
      page: () => ExhibitionDetailPage(),
      binding: ExhibitionDetailBinding(),
    ),
  ];
}
