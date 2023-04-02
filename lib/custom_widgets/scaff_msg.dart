import 'package:flutter/material.dart';
import 'package:icon_animated/animated_icons.dart';
import 'package:kamara_parent_app_ui/colors.dart';

class ScaffoldMsg {
  final BuildContext cx;
  final SnackBarBehavior behavior;
  final String msg;
  final DateTime? dateTime;
  const ScaffoldMsg({
    required this.cx,
    this.behavior = SnackBarBehavior.floating,
    required this.msg,
    this.dateTime,
  });
  showCustomFloating({
    Color backgroundColor = MyColors.colorPrimary,
    EdgeInsets padding =
        const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
    radius = const BorderRadius.all(Radius.circular(12.0)),
    TextStyle textStyle = const TextStyle(color: MyColors.colorOnPrimary),
    Duration duration = const Duration(milliseconds: 2000),
    required AnimationController animationController,
    required Animation<double> animation,
    double elevation = 10.0,
    Color shadowColor = Colors.black45,
    Color iconColor = MyColors.colorOnPrimary,
    double strokeWidth = 5.0,
    required IconType iconType,
    double iconSize = 40.0,
  }) {
    ScaffoldMessenger.of(cx).showSnackBar(SnackBar(
      onVisible: () {
        animationController.forward();
      },
      behavior: behavior,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      duration: duration,
      content: _content(
        iconType: iconType,
        iconSize: iconSize,
        shadowColor: shadowColor,
        elevation: elevation,
        backgroundColor: backgroundColor,
        padding: padding,
        radius: radius,
        textStyle: textStyle,
        animationController: animationController,
        animation: animation,
        iconColor: iconColor,
        strokeWidth: strokeWidth,
      ),
    ));
  }

  Widget _content({
    required Color backgroundColor,
    required EdgeInsets padding,
    required radius,
    required TextStyle textStyle,
    required double elevation,
    required Color shadowColor,
    required AnimationController animationController,
    required Animation<double> animation,
    required double iconSize,
    required Color iconColor,
    required double strokeWidth,
    required IconType iconType,
  }) {
    return Center(
      heightFactor: double.minPositive + 2.0,
      child: Card(
        elevation: elevation,
        shadowColor: shadowColor,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
        ),
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconAnimated(
                      strokeWidth: strokeWidth,
                      color: iconColor,
                      progress: animation,
                      size: iconSize,
                      iconType: iconType),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      msg,
                      style: textStyle,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dateTime?.toString().characters.take(10).join() ?? "",
                  style: const TextStyle(
                    color: MyColors.colorOnPrimary,
                    fontSize: 12.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
