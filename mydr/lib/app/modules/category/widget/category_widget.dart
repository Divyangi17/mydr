import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydr/app/modules/dashboard/views/dashboard_view.dart';
import '../../../core/utils/common.dart';
import '../../../core/widget/ripple.dart';
import '../../main/views/main_view.dart';
import '../controllers/category_controller.dart';
import '../data/basic_tile.dart';
import '../model/category_data.dart';
import '/app/core/base/base_widget_mixin.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/elevated_container.dart';
import '/app/core/widget/icon_text_widgets.dart';
import '/app/routes/app_pages.dart';
import 'basic_tile.dart';
class CategoryWidget extends StatefulWidget {
  final CategoryController categoryController;
  CategoryWidget({
    Key? formKey,
    required this.categoryController,
  }) : super();

  @override
  CategoryWidgetState createState() => CategoryWidgetState();
}

// class RegisterCard extends StatefulWidget {
//
//   @override
//   RegisterCardState createState() => RegisterCardState();
// }

class CategoryWidgetState extends State<CategoryWidget> {

  @override
  Widget build(BuildContext context) {

    return
      ListView(
        children:
        basicTiles.map((tile) => BasicTileWidget(tile: tile, key: tile.key)).toList(),
      );
      // SingleChildScrollView(
      //     child:Column(
      //       children: [
      //         GetX<CategoryController>(builder:(controller){
      //           return  Text("Category ${controller.test.value}");
      //         }),
      //         ListView(

      //
      //       ],
      //     )
      //
      //   //)
      // );

  }


}
