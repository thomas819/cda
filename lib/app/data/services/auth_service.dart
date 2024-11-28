import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/values/keys.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  late GetStorage box;


  Future<AuthService> init() async {
    box = GetStorage();
    await box.writeIfNull(Keys.isLogged, false);
    // await box.writeIfNull(Keys.userId, -1);

    return this;
  }

  isLogged() => box.read(Keys.isLogged);

  userId() => box.read(Keys.userId);

  accessToken() => box.read(Keys.accessToken);

  nickname() => box.read(Keys.nickname);

  changeIsLogged(_) async => box.write(Keys.isLogged, _);

  changeAccessToken(_) async => box.write(Keys.accessToken, _);

  changeUserId(_) => box.write(Keys.userId, _);

  changeNickname(_) => box.write(Keys.nickname, _);

  // changeIsOpenedAuthPopup(_) => box.write(Keys.isOpenedAuthPopup, _);

  logout() async {
    box.erase();
    changeIsLogged(false);
  }
}
