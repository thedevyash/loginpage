import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginpage/models/palette.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  // ignore: prefer_typing_uninitialized_variables
  final double horizontalPadding;
  const SocialButton(
      {super.key,
      required this.iconPath,
      required this.label,
      this.horizontalPadding = 100});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      // ignore: deprecated_member_use
      icon: SvgPicture.asset(iconPath, width: 25, color: Pallete.whiteColor),
      label: Text(
        label,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: 30)),
    );
  }
}
