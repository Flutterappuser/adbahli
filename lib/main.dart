import 'package:adbahli/core/constant/color.dart';
import 'package:adbahli/core/localization/translation.dart';
import 'package:adbahli/routes.dart';
import 'package:adbahli/view/screen/auth/choose_role_screen.dart';
import 'package:adbahli/view/screen/auth/login.dart';
import 'package:adbahli/view/screen/auth/register.dart';
import 'package:adbahli/view/screen/auth/register_step2.dart';
import 'package:adbahli/view/screen/home/home2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/services/services.dart';
import 'view/screen/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            bodyLarge: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          )),
      home: InformationCompletionScreen(),
      routes: routes,
    );
  }
}
