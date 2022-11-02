import 'package:get/get.dart';

import '../model/category_screen.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';

class CategoryController extends BaseController {

  final _selectedScreenController = CategoryScreen.SCREEN1.obs;
  CategoryScreen get selectedMenuCode => _selectedScreenController.value;

  var obsecure1 = true.obs;
  var test = "test".obs;
  onchangeScreen(CategoryScreen CategoryScreen) async {
    _selectedScreenController(CategoryScreen);
  }

}
