import 'package:adbahli/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../screen/auth/animatedhover.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(bottom: 30),
        height: 50,
        child: AnimatedHover(
          size: Size(300, 40),
          hoverColor: Colors.white,
          bgColor: Colors.white,
          border: Border.all(),
          borderRadiusShadow: BorderRadius.circular(0),
          borderRadius: BorderRadius.circular(0),
          duration: Duration(microseconds: 800),
          offset: Offset(4, 4),
          clicked: true,
          child: MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
              textColor: Colors.black87,
              onPressed: () {
                controller.next();
              },
              color: Color(0xFFF7F1FB),
              child: const Text("Continue")),
        ),
      ),
    );
  }
}
