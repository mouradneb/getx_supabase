import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_supabase/app/modules/home/controllers/home_controller.dart';
import 'package:getx_supabase/app/routes/app_pages.dart';

class LoginController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  final loginFormKey = new GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  login() {
    if (loginFormKey.currentState!.validate()) {
      homeController.supabase_client.auth
          .signIn(email: email.text, password: password.text)
          .then((value) {
        if (value.error != null) {
          // account does not exist or wrong password
          print("----------------- error ${value.error}");
          return;
        }
        Get.offNamed(Routes.WELCOME);
      }, onError: (err) => print("++++++++++++++++++++ $err"));
    }
  }
}
