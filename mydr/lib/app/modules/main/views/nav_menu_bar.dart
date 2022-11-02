import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/nav_menu_controller.dart';
import '../model/nav_menu_item.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/main/controllers/bottom_nav_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/model/menu_item.dart';

// ignore: must_be_immutable
class NavMenuBar extends StatelessWidget {
  final Function(MenuCode menuCode) onNewMenuSelected;

  NavMenuBar({Key? key, required this.onNewMenuSelected}) : super(key: key);
  // late AppLocalizations appLocalization;

  final navController = NavMenuController();

  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // appLocalization = AppLocalizations.of(context)!;

    Color selectedItemColor = Colors.white;
    Color unselectedItemColor = Colors.grey;
    List<NavMenuItem> navItems = _getNavItems();

    return Drawer(
      child: ListView.builder(
        itemCount: navItems.length,
        itemBuilder: (BuildContext context, int index) {
      String key = navItems[index].navPage;
      return Column(
          children: <Widget>[
            ListTile(
              title: new Text(navItems[index].navTitle),
              onTap: () {
                Get.toNamed("/category");
              },
            ),
            const Divider(
              height: 2.0,
            ),
          ],
        );
      },
      ),
    );
  }

  List<NavMenuItem> _getNavItems() {
    return [
      NavMenuItem(
        navTitle: "Category",
        navPage: '',
      ),
      NavMenuItem(
          navTitle: "Item2",
          navPage: '',),
      NavMenuItem(
          navTitle: "Item3",
          navPage: '',
      )

    ];
  }
}
