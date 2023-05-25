import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../view/screen/auth/choose_role_screen.dart';

class ChooseRoleController extends GetxController {
  var selectedRole = Role.Defualt;
  bool clickedContainerDabah = false;
  bool clickedContainerUser = false;
  bool clicked = false;

  onClicked() {
    clicked = !clicked;
    update();
  }

  void selectRole(Role role) {
    selectedRole = role;
    update();
  }

  onClickedContainerDabah() {
    clickedContainerDabah = !clickedContainerDabah;

    update();
  }

  onClickedContainerUser() {
    clickedContainerUser = !clickedContainerUser;

    update();
  }
}
