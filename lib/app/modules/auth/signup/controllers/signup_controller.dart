import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_supabase/app/modules/home/controllers/home_controller.dart';

class SignupController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  final signupFormKey = new GlobalKey<FormState>();
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

  signup() {
    if (signupFormKey.currentState!.validate())
      homeController.supabase_client.auth.signUp(email.text, password.text);
    Get.snackbar("Sign UP",
        "Please, check given mailbox email to activate your account.",
        duration: Duration(seconds: 5));
    Get.back();
  }
}
