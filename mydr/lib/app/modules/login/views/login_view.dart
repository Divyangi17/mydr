import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../widget/login_widget.dart';
import '/app/core/base/base_view.dart';

class LoginView extends BaseView<LoginController> {
  LoginView() {
    // controller.getGithubGetxProjectList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return LoginWidget(loginController: Get.find<LoginController>(),);

      TextButton(
      onPressed: () {
        Get.toNamed("/main");
      },
      child: Text("Login"),);
  }
}
