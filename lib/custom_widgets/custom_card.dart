import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';

class CustomCard extends StatelessWidget {
  final Color shadowColor;
  final double blurRadius;
  final Offset offset;
  final BlurStyle blurStyle;
  final double spreadRadius;
  final BorderRadius borderRadius;
  final Widget child;

  const CustomCard({
    Key? key,
    this.shadowColor = MyColors.cardShadow,
    this.blurRadius = 5.0,
    this.offset = Offset.zero,
    this.blurStyle = BlurStyle.normal,
    this.spreadRadius = 0.0,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: MyColors.colorOnPrimary,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: blurRadius,
              offset: offset,
              blurStyle: blurStyle,
              spreadRadius: spreadRadius,
            ),
          ],
          borderRadius: borderRadius,
        ),
        child: child,
      );
}
