import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;

  const CustomTextFormAuth(
      {Key? key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: mycontroller,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext)),
            suffixIcon: Icon(iconData),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
