import 'package:adbahli/view/screen/onboarding.dart';
import 'package:adbahli/view/screen/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../../controller/onclicked.dart';
import '../../widget/onboarding/auth/customtextfield.dart';
import '../../widget/onboarding/auth/logo.dart';
import '../home/home.dart';
import 'animatedhover.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _register() {
    if (_formKey.currentState!.validate()) {
      String user = userController.text;
      String email = emailController.text;
      String password = passwordController.text;
      registerUser(user, email, password);
    }
  }

  void registerUser(String name, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      print('created');
      // Sometimes when we want to create user with username
      // 1. first we get the user and we update display name
      // if we want to check the name updated we should reload
      User? user = await userCredential.user;
      if (user != null) {
        await user.updateDisplayName(name);

        // image = user.photoURL;
        // phoneNumber = user.phoneNumber;

// Retrieve the asset URL using rootBundle

        //String? url = await rootBundle.loadString(assetPath);

        //await user.updatePhotoURL('https://picsum.photos/250?image=8');

        Get.to(ProfilPage());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    onclicked controller = Get.put((onclicked()));
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Register',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<onclicked>(
                  builder: (controller) => AnimatedHover(
                    size: Size(350, 56),
                    hoverColor: Colors.white,
                    bgColor: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                    borderRadiusShadow: BorderRadius.circular(12),
                    clicked: controller.clickedTextFieldLoginUserName,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      child: FocusScope(
                        child: Focus(
                          onFocusChange: (focus) =>
                              controller.OnclickedTextFieldLoginUserName(focus),
                          child: TextFormField(
                            controller: userController,
                            decoration: const InputDecoration(
                              hintText: 'User name',
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<onclicked>(
                  builder: (controller) => AnimatedHover(
                    size: Size(350, 56),
                    hoverColor: Colors.white,
                    bgColor: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                    borderRadiusShadow: BorderRadius.circular(12),
                    clicked: controller.clickedTextFieldLoginEmail,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      child: FocusScope(
                        child: Focus(
                          onFocusChange: (focus) =>
                              controller.OnclickedTextFieldLoginEmail(focus),
                          child: TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<onclicked>(
                  builder: (controller) => AnimatedHover(
                    size: Size(350, 56),
                    hoverColor: Colors.white,
                    bgColor: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                    borderRadiusShadow: BorderRadius.circular(12),
                    clicked: controller.clickedTextFieldLoginPassword,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      child: FocusScope(
                        child: Focus(
                          onFocusChange: (focus) =>
                              controller.OnclickedTextFieldLoginPassword(focus),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<onclicked>(
                  builder: (controller) => AnimatedHover(
                    size: Size(350, 50),
                    hoverColor: Colors.white,
                    bgColor: Colors.white,
                    border: Border.all(),
                    borderRadiusShadow: BorderRadius.circular(30),
                    borderRadius: BorderRadius.circular(30),
                    duration: Duration(microseconds: 800),
                    offset: Offset(3, 3),
                    clicked: true,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Register');
                        // Navigate to the registration screen for clients
                        _register();
                      },
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 1,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text('Or you can log in with:'),
                    SizedBox(width: 10),
                    Container(
                      width: 120,
                      height: 1,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedHover(
                      size: Size(160, 50),
                      hoverColor: Colors.white,
                      bgColor: Colors.white,
                      border: Border.all(),
                      borderRadiusShadow: BorderRadius.circular(30),
                      borderRadius: BorderRadius.circular(30),
                      duration: Duration(microseconds: 800),
                      offset: Offset(3, 3),
                      clicked: true,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Handle button press
                        },
                        icon: Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                        ),
                        label: Text('Facebook',
                            style: Theme.of(context).textTheme.displayLarge),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    AnimatedHover(
                      size: Size(160, 50),
                      hoverColor: Colors.white,
                      bgColor: Colors.white,
                      border: Border.all(),
                      borderRadiusShadow: BorderRadius.circular(30),
                      borderRadius: BorderRadius.circular(30),
                      duration: Duration(microseconds: 800),
                      offset: Offset(3, 3),
                      clicked: true,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Handle button press
                        },
                        icon: Icon(
                          FontAwesomeIcons.google,
                          size: 20.0,
                          color: Colors.green,
                        ),
                        label: Text('Google',
                            style: Theme.of(context).textTheme.displayLarge),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You have an account?'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Log in',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
