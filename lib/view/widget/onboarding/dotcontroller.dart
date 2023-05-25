import 'package:adbahli/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: const Duration(milliseconds: 900),
                    width: controller.current_page == index ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 51, 49, 53),
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ],
      ),
    );
  }
}
