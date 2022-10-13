import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/model/sidemenu_item.dart';
import '../../../core/values/app_colors.dart';
import '../../dashboard/views/dashboard_view.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/favorite/views/favorite_view.dart';
// import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/views/bottom_nav_bar.dart';
import '/app/modules/other/views/other_view.dart';
import '/app/modules/settings/views/settings_view.dart';
import 'nav_menu_bar.dart';

// ignore: must_be_immutable
class MainView extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: Obx(() => getPageOnSelectedMenu(controller.selectedMenuCode)),
    );
  }

  @override
  Widget? bottomNavigationBar() {

    return BottomNavBar(onNewMenuSelected: controller.onMenuSelected);
  }

  // @override
  // Widget? drawer() {
  //   return NavMenuBar(onNewMenuSelected: controller.onMenuSelected);
  //
  //
  // }


  // final HomeView homeView = HomeView();
  final DashboardView dashboardView = DashboardView();
  FavoriteView? favoriteView;
  SettingsView? settingsView;

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.DASHBOARD:
        return dashboardView;
      case MenuCode.FAVORITE:
        favoriteView ??= FavoriteView();
        return favoriteView!;
      case MenuCode.SETTINGS:
        settingsView ??= SettingsView();
        return settingsView!;
      default:
        return OtherView(
          viewParam: describeEnum(menuCode),
        );
    }
  }
}
