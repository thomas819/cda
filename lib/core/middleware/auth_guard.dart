import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/data/services/auth_service.dart';
import '../../routes/app_pages.dart';

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // print('@@AuthGuard = ${AuthService.to.userLevel()}');

    if (!AuthService.to.isLogged()) {
      return const RouteSettings(name: Routes.authAgreement);
    }

    return null;
  }
}
