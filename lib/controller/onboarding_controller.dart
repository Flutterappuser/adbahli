import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int current_page = 0;
  @override
  next() {}

  @override
  onPageChanged(int index) {
    current_page = index;
    update();
  }
}
