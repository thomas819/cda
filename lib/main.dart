import 'package:cda/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
// import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'app/data/services/auth_service.dart';
import 'app/modules/main/binding.dart';
import 'core/theme/app_theme.dart';
import 'core/values/consts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Get.putAsync(() => AuthService().init());

  await NaverMapSdk.instance.initialize(
      clientId: Consts.naverMapClientId,
      onAuthFailed: (error) {
        print('Auth failed: $error');
      });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cda',
      theme: appThemeData(),
      initialBinding: MainBinding(),
      initialRoute: Routes.main,
      // initialBinding: AuthBinding(),
      // initialRoute: Routes.auth,
      getPages: AppPages.pages,
    );
  }


}

