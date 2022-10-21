import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/core/widget/paging_view.dart';
import '../controllers/dashboard_controller.dart';
import '../widget/item_github_project.dart';

class DashboardView extends BaseView<DashboardController> {
  DashboardView() {
    // Get.put(DashboardController());
    controller.getGithubGetxProjectList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
    // return CustomAppBar(
    //   appBarTitleText: 'GetX Templates on GitHub Dash',
    // );
  }

  @override
  Widget body(BuildContext context) {
    return
    //   Scaffold(
    //   drawer: NavigationDrawer(),
    //   appBar: AppBar(
    //     title: Text('HomeView'),
    //     centerTitle: true,
    //   ),
    // );
      PagingView(
      onRefresh: () async {
        controller.onRefreshPage();
      },
      onLoadNextPage: () {
        controller.onLoadNextPage();
      },
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Obx(
          () => ListView.separated(
            shrinkWrap: true,
            itemCount: controller.projectList.length,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var model = controller.projectList[index];

              return ItemGithubProject(dataModel: model);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: AppValues.smallMargin),
          ),
        ),
      ),
    );
  }
}
