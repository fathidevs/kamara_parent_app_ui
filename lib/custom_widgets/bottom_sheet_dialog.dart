import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';

class BottomSheetDialog {
  final BuildContext cx;

  /// the background color of the BSD
  final Color backgroundColor;

  /// margin for floating BSD
  final EdgeInsets floatingMargin;

  /// padding for floating BSD
  final EdgeInsets floatingPadding;

  /// radius for floating BSD
  final BorderRadius floatingRadius;

  /// radius for regular BSD
  final BorderRadius radius;

  /// header is to determine how users dismiss the BSD,
  /// there is two types of headers:
  /// 1- (pull) downward to dismiss
  /// 2- (click) button to dismiss
  final Widget header;

  const BottomSheetDialog({
    required this.cx,
    this.backgroundColor = MyColors.colorOnPrimary,
    this.floatingMargin =
        const EdgeInsets.symmetric(horizontal: 15.0, vertical: 35.0),
    this.floatingPadding = const EdgeInsets.all(10.0),
    this.floatingRadius = const BorderRadius.all(Radius.circular(20.0)),
    this.radius = const BorderRadius.only(
        topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
    required this.header,
  });

  Future<dynamic> floating(Widget child) {
    return showModalBottomSheet(
        context: cx,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              header,
              Container(
                margin: floatingMargin,
                padding: floatingPadding,
                decoration: BoxDecoration(
                    color: backgroundColor, borderRadius: floatingRadius),
                child: child,
              ),
            ],
          );
        });
  }

  Future<dynamic> regular(Widget child) {
    return showModalBottomSheet(
        context: cx,
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: radius),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              header,
              Container(
                  decoration: BoxDecoration(
                      color: backgroundColor, borderRadius: radius),
                  child: child),
            ],
          );
        });
  }
}

class DialogHeader {
  final double width;
  final Color color;
  final double thickness;
  final EdgeInsets padding;
  const DialogHeader({
    this.width = 100.0,
    this.color = MyColors.colorOnPrimary,
    this.thickness = 13.0,
    this.padding = const EdgeInsets.only(bottom: 15.0, top: 10.0),
  });
  Widget pull() {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width,
            height: thickness,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(300.0),
              // shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }

  Widget floatingPull() {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width,
            height: thickness,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(300.0),
              // shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }
}
