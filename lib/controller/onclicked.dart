import 'package:get/get.dart';

class onclicked extends GetxController {
  bool clicked = false;
  bool clickedTextFieldLoginUserName = false;
  bool clickedTextFieldLoginEmail = false;
  bool clickedTextFieldLoginPassword = false;
  bool clickedTextFieldRegisterEmail = false;
  bool clickedTextFieldRegisterPassword = false;
  bool clickedTextFieldRegisterPasswordSecond = false;
  bool clickedButtonSelectRole = false;
  bool clickedButtonSignIn = false;
  bool clickedButtonSignUp = false;
  bool clickedContainerDabah = false;
  bool clickedContainerUser = false;
  bool clickedContainer3 = false;
  bool clickedContainer4 = false;

  onClicked() {
    clicked = !clicked;
    update();
  }

  OnclickedTextFieldLoginEmail(bool focus) {
    clickedTextFieldLoginEmail = focus;
    update();
  }

  OnclickedTextFieldLoginUserName(bool focus) {
    clickedTextFieldLoginUserName = focus;
    update();
  }

  OnclickedTextFieldLoginPassword(bool focus) {
    clickedTextFieldLoginPassword = focus;
    update();
  }

  onClickedContainerDabah() {
    clickedContainerDabah = !clickedContainerDabah;
    if (clickedContainerDabah == true) {
      clickedContainerUser == false;
    }
    if (clickedContainerDabah == false) {
      clickedContainerUser == true;
    }
    update();
  }

  onClickedContainerUser() {
    clickedContainerUser = !clickedContainerUser;
    if (clickedContainerUser == true) {
      clickedContainerDabah == false;
    }
    if (clickedContainerDabah == false) {
      clickedContainerUser == true;
    }
    update();
  }

  onClickedContainer3() {
    clickedContainer3 = !clickedContainer3;
    update();
  }

  onClickedContainer4() {
    clickedContainer4 = !clickedContainer4;
    update();
  }
}
