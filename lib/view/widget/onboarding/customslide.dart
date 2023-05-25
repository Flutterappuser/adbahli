import 'package:adbahli/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(
                  onBoardingList[i].title!,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 80),
                Image.asset(
                  onBoardingList[i].image!,
                  width: 200,
                  height: 230,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 80),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(onBoardingList[i].body!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium)),
              ],
            ));
  }
}
