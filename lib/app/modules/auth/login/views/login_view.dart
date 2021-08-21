import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LoginView'),
          centerTitle: true,
        ),
        body: Center(
          child: Form(
            key: controller.loginFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.email,
                    validator: (val) {
                      if (!GetUtils.isEmail(val!)) return "Valid email, plz !";
                      if (val.isEmpty || val.trim().isEmpty)
                        return "Email could not be emprt !";
                    },
                    decoration: InputDecoration(
                      hintText: "mourad.nebhi@gmail.com",
                      labelText: "email",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.password,
                    validator: (val) {
                      if (val!.isEmpty) return "Password could not be empty !";
                    },
                    decoration: InputDecoration(
                      hintText: "********",
                      labelText: "password",
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => controller.login(), child: Text("Login"))
                ],
              ),
            ),
          ),
        ));
  }
}
