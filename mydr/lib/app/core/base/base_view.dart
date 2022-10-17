import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../model/sidemenu_item.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/model/page_state.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/widget/loading.dart';
import '/flavors/build_config.dart';
import 'base_bottom_bar.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  // AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final Logger logger = BuildConfig.instance.config.logger;

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          Obx(() => controller.pageState == PageState.LOADING
              ? _showLoading()
              : Container()),
          Obx(() => controller.errorMessage.isNotEmpty
              ? showErrorSnackBar(controller.errorMessage)
              : Container()),
          Container(),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      drawer: drawer(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: body(context),
    );
  }

  Widget showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    return Container();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1
    );
  }

  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  Color statusBarColor() {
    return AppColors.pageBackground;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
    // return BaseBottomBar(onNewMenuSelected: controller.onMenuSelected);
  }

  Widget? drawer() {
    // List<SideMenuItem> navItems = _getNavItems();
     return null;
    //   return Drawer(
    //   child: Container(
    //     color: AppColors.lightGreyColor,
    //     child: ListView.builder(
    //       itemCount: navItems.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         String key = navItems[index].navPage;
    //         return Column(
    //           children: <Widget>[
    //             ListTile(
    //               title: new Text(navItems[index].navTitle),
    //             ),
    //             const Divider(
    //               height: 2.0,
    //             ),
    //           ],
    //         );
    //       },
    //     ),
    //   )
    // );
  }

  // List<SideMenuItem> _getNavItems() {
  //   return [
  //     SideMenuItem(
  //       navTitle: "Item1",
  //       navPage: '',
  //     ),
  //     SideMenuItem(
  //       navTitle: "Item2",
  //       navPage: '',),
  //     SideMenuItem(
  //       navTitle: "Item3",
  //       navPage: '',
  //     )
  //
  //   ];
  // }

  Widget _showLoading() {
    return const Loading();
  }
}
