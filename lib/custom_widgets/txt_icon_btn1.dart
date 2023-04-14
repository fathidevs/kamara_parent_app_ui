import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/tools.dart';

class TxtIconBtn {
  final VoidCallback onPressed;
  final Icon icon;
  final Text label;
  final EdgeInsets padding;
  final double radius;

  const TxtIconBtn({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.padding = const EdgeInsets.only(left: 15.0),
    this.radius = 5.0,
  });

  splash({bool reversed = false}) {
    return Container(
      margin: padding,
      child: InkWell(
        onTap: onPressed,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: label,
            ),
            icon,
          ].reverse(reversed),
        ),
      ),
    );
  }

  noSplash({bool reversed = false}) {
    return Container(
      margin: padding,
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: label,
            ),
            icon,
          ].reverse(reversed),
        ),
      ),
    );
  }
}
