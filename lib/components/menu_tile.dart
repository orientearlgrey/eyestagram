import 'package:flutter/material.dart';

class EyestagramMenuTile extends StatelessWidget {
  const EyestagramMenuTile({
    super.key,
    required this.leading,
    required this.titleText,
    this.isActive = false,
    this.onTap,
  });

  final double tileSpacing = 4.0;
  final bool isActive;
  final Widget leading;
  final String titleText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: tileSpacing,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      leading: leading,
      title: Text(
        titleText,
        style: TextStyle(
          fontFamily: "SF Pro",
          fontSize: 16,
          fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
          letterSpacing: -0.75,
        ),
      ),
      onTap: onTap,
    );
  }
}
