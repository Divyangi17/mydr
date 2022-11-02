import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';
//import '../widget/login_widget.dart';
import '../widget/category_widget.dart';
import '/app/core/base/base_view.dart';

class CategoryView extends BaseView<CategoryController> {
  LoginView() {
    // controller.getGithubGetxProjectList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return CategoryWidget(categoryController: Get.find<CategoryController>(),);

      TextButton(
      onPressed: () {
        Get.toNamed("/main");
      },
      child: Text("Login"),);
  }
}
