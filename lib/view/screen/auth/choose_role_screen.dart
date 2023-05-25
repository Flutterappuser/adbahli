import 'package:adbahli/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/choose_you_role_controller.dart';
import '../home/home.dart';
import '../home/home2.dart';
import 'animatedhover.dart';

enum Role { client, user, Defualt }

class ChooseRoleScreen extends StatelessWidget {
  final ChooseRoleController conChoose = Get.put(ChooseRoleController());
  //final onclicked conClicked = Get.put(onclicked());
  bool firstTime = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<ChooseRoleController>(
      builder: (controller3) => Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              'Choose your role',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    conChoose.selectRole(Role.client);
                    conChoose.onClickedContainerUser();
                    firstTime = true; // Update firstTime flag
                  },
                  child: AnimatedHover(
                    size: Size(150, 160),
                    hoverColor: Colors.white,
                    bgColor: Colors.white,
                    border: Border.all(),
                    borderRadiusShadow: BorderRadius.circular(12),
                    borderRadius: BorderRadius.circular(12),
                    clicked: (conChoose.selectedRole == Role.client)
                        ? false
                        : firstTime,
                    child: Container(
                      width: 150,
                      height: 160,
                      decoration: BoxDecoration(
                        color: conChoose.selectedRole == Role.client
                            ? Color.fromARGB(255, 193, 232, 101)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'I am a Dabah',
                          style: TextStyle(
                            fontSize: 20,
                            color: conChoose.selectedRole == Role.client
                                ? Colors.black
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    conChoose.selectRole(Role.user);
                    conChoose.onClickedContainerDabah();
                    firstTime = true; // Update firstTime flag
                  },
                  child: AnimatedHover(
                    size: Size(150, 160),
                    hoverColor: Colors.white,
                    bgColor: Colors.white,
                    border: Border.all(),
                    borderRadiusShadow: BorderRadius.circular(12),
                    borderRadius: BorderRadius.circular(12),
                    clicked: (conChoose.selectedRole == Role.user)
                        ? false
                        : firstTime,
                    child: Container(
                      width: 150,
                      height: 160,
                      decoration: BoxDecoration(
                        color: conChoose.selectedRole == Role.user
                            ? Color.fromARGB(255, 193, 232, 101)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'I am a user',
                          style: TextStyle(
                            fontSize: 20,
                            color: conChoose.clicked == true
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 150),
            GetBuilder<ChooseRoleController>(
              builder: (controller) => AnimatedHover(
                size: Size(200, 50),
                hoverColor: Colors.white,
                bgColor: Colors.white,
                border: Border.all(),
                borderRadiusShadow: BorderRadius.circular(30),
                borderRadius: BorderRadius.circular(30),
                duration: Duration(microseconds: 800),
                offset: Offset(4, 4),
                clicked: true,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.selectedRole == Role.client) {
                      // Navigate to the registration screen for clients
                      Get.to(Login());
                    } else if (controller.selectedRole == Role.user) {
                      // Navigate to the login screen for users
                      Get.to(CitySearchPage());
                    }
                  },
                  child: Text(
                    'Choose',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
