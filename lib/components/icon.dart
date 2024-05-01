import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EyestagramIcon extends StatelessWidget {
  const EyestagramIcon(
    this.assetName, {
    super.key,
    this.height = 24,
  });

  final double height;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
    );
  }
}
