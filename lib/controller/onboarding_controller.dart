import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int current_page = 0;
  @override
  next() {
    current_page++;
    if (current_page > onBoardingList.length - 1) {
      current_page = 0;
      pageController.animateToPage(current_page,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      pageController.animateToPage(current_page,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  @override
  onPageChanged(int index) {
    current_page = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
