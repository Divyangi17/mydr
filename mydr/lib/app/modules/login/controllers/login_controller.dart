import 'package:get/get.dart';

import '../model/login_screen.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';

class LoginController extends BaseController {

  final _selectedScreenController = LoginScreen.SCREEN1.obs;
  LoginScreen get selectedMenuCode => _selectedScreenController.value;

  var obsecure1 = true.obs;

  onchangeScreen(LoginScreen loginScreen) async {
    _selectedScreenController(loginScreen);
  }

}
