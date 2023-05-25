import 'package:flutter/material.dart';

import '../../../../core/constant/imageasset.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Adjust the width to your desired size
      height: 100, // Adjust the height to your desired size
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Controls the shadow position
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          AppImageAsset.LogoImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
