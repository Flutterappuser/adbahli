import 'package:adbahli/controller/onclicked.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/onboarding_controller.dart';

class AnimatedHover extends StatelessWidget {
  const AnimatedHover({
    super.key,
    required this.child,
    this.size = const Size(440, 440),
    this.hoverColor = Colors.yellowAccent,
    this.bgColor = Colors.white,
    this.offset = const Offset(8, 8),
    this.curve = Curves.easeInOutBack,
    this.duration = const Duration(microseconds: 400),
    this.border = const Border(),
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    this.borderRadiusShadow = const BorderRadius.all(Radius.circular(12)),
    this.clicked = false,
  });
  final Widget child;
  final Size size;
  final Color hoverColor;
  final Color bgColor;
  final Offset offset;
  final Curve curve;
  final Duration duration;
  final Border border;
  final BorderRadiusGeometry borderRadius;
  final BorderRadiusGeometry borderRadiusShadow;
  final bool clicked;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: borderRadius,
          ),
        ),
        AnimatedPositioned(
          top: clicked ? -offset.dy : 0,
          right: clicked ? offset.dx : 0,
          curve: curve,
          duration: duration,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            child: AnimatedContainer(
              duration: duration,
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                color: hoverColor,
                borderRadius: borderRadiusShadow,
                border: border,
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
