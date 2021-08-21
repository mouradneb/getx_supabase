import 'package:get/get.dart';

import 'package:getx_supabase/app/modules/auth/login/bindings/login_binding.dart';
import 'package:getx_supabase/app/modules/auth/login/views/login_view.dart';
import 'package:getx_supabase/app/modules/auth/signup/bindings/signup_binding.dart';
import 'package:getx_supabase/app/modules/auth/signup/views/signup_view.dart';
import 'package:getx_supabase/app/modules/home/bindings/home_binding.dart';
import 'package:getx_supabase/app/modules/home/views/home_view.dart';
import 'package:getx_supabase/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:getx_supabase/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
  ];
}
