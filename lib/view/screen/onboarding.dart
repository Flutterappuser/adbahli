import 'package:adbahli/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslide.dart';
import '../widget/onboarding/dotcontroller.dart';
import 'auth/animatedhover.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding(),
                  ],
                ))
          ]),
        ));
  }
}
