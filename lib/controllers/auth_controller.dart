import 'package:get/get.dart';

enum PageState { login, register, profile }

class AuthController extends GetxController {
  var pageState = PageState.profile.obs;

  void goToLogin() {
    pageState.value = PageState.login;
  }

  void goToRegister() {
    pageState.value = PageState.register;
  }

  void goToProfile() {
    pageState.value = PageState.profile;
  }
}
