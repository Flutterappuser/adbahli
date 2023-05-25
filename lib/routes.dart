import 'package:adbahli/controller/choose_you_role_controller.dart';
import 'package:adbahli/view/screen/auth/choose_role_screen.dart';
import 'package:flutter/material.dart';

import 'core/constant/routes.dart';
import 'view/screen/auth/login.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => Login(),
  AppRoute.chooseRole: (context) => ChooseRoleScreen(),
};
