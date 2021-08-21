import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_supabase/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: controller.obx((data) => (data == null || data.length <= 0)
          ? CircularProgressIndicator()
          : Column(
              children: [
                Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: data
                            .map((employee) => Card(
                                    child: ListTile(
                                  leading: employee.imageUrls!.length > 0
                                      ? CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              employee.imageUrls![0]),
                                        )
                                      : Text("No Picture"),
                                  title: Text("${employee.name}"),
                                )))
                            .toList(),
                      ),
                    )),
                Expanded(flex: 3, child: Placeholder()),
                AuthWidget()
              ],
            )),
    );
  }
}

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            child: GestureDetector(
              child: Text(
                "Login.",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () => Get.toNamed(Routes.LOGIN),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("-- OR --"),
          ),
          SizedBox(
            child: GestureDetector(
              child: Text(
                "Create Account",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () => Get.toNamed(Routes.SIGNUP),
            ),
          ),
        ]),
      ),
    );
  }
}
