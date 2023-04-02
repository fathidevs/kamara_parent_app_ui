import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';

import '../screens/settings.dart';

class DisplayPhoto extends StatelessWidget {
  final Widget img;
  final BorderRadius imgRadius;
  final BorderRadius strokeRadius;
  final double strokeSize;
  final Color strokeColor;
  final EdgeInsets padding;
  final bool isHomeScreen;
  final bool hideShadow;
  const DisplayPhoto({
    Key? key,
    required this.img,
    this.imgRadius = const BorderRadius.all(Radius.circular(10.0)),
    this.strokeRadius = const BorderRadius.all(Radius.circular(12.0)),
    this.strokeSize = 4.5,
    this.strokeColor = MyColors.colorOnPrimary,
    this.padding = const EdgeInsets.only(left: 10.0, bottom: 10.0),
    this.isHomeScreen = true,
    this.hideShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Container(
          margin: isHomeScreen
              ? EdgeInsets.only(top: MediaQuery.of(context).size.width * .05)
              : EdgeInsets.zero,
          padding: EdgeInsets.all(strokeSize),
          decoration: BoxDecoration(
            color: strokeColor,
            borderRadius: strokeRadius,
            boxShadow: [
              if (!hideShadow) Shadows.mainImgThumbnail(),
            ],
          ),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: ClipRRect(
              borderRadius: imgRadius,
              child: img,
            ),
          ),
        ),
      );
}
