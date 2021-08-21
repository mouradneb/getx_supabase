import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_supabase/app/modules/home/bindings/home_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HomeBinding().dependencies();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
