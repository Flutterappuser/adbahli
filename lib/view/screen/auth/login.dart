import 'package:adbahli/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../../controller/onclicked.dart';
import '../../widget/onboarding/auth/customtextfield.dart';
import '../../widget/onboarding/auth/logo.dart';
import '../home/home2.dart';
import 'animatedhover.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? _validatePassword(String? value) {
    return value == null || value.isEmpty ? "Password can't be empty" : null;
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform login functionality
      String email = emailController.text;
      String password = passwordController.text;
      print(email);
      print(password);
      loginUser(email, password);

      // Perform login functionality using email and password
    }
  }

  void loginUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
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
                  'Login',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedHover(
                    size: Size(100, 100),
                    hoverColor: Colors.white,
                    bgColor: Colors.white,
                    border: Border.all(),
                    offset: Offset(4, 4),
                    borderRadius: BorderRadius.circular(100),
                    borderRadiusShadow: BorderRadius.circular(100),
                    clicked: true,
                    child: LogoWidget()),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child:
                            Container()), // Empty container to push text to the right
                    Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
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
                        _login();
                        // Navigate to the registration screen for clients
                        Get.to(CitySearchPage());
                      },
                      child: Text(
                        'Sign In',
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
                    Text(
                      'Or login with',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
                    Text('Dont have an account?'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Register',
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
