import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/screens/settings.dart';

class TextField1 extends StatefulWidget {
  final TextEditingController? textCtrl;
  final EdgeInsets margin;
  final EdgeInsets contentPadding;
  final double radius;
  final Color colorBackground;
  final String hint;
  final TextStyle hintStyle;
  final TextInputAction action;
  final IconData icon;
  final Color iconColor;

  const TextField1({
    Key? key,
    this.textCtrl,
    this.margin = const EdgeInsets.symmetric(horizontal: 35.0),
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
    this.radius = 19.0,
    this.colorBackground = MyColors.colorOnPrimary,
    this.hint = "Hint",
    this.hintStyle = const TextStyle(
      color: MyColors.colorPrimary50,
    ),
    this.action = TextInputAction.done,
    this.icon = Icons.abc_rounded,
    this.iconColor = MyColors.colorPrimary,
  }) : super(key: key);

  @override
  State<TextField1> createState() => _TextField1State();
}

class _TextField1State extends State<TextField1> {
  @override
  Widget build(BuildContext context) => Container(
        margin: widget.margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.colorBackground,
            boxShadow: [
              Shadows.elevatedTextField(),
            ]),
        child: TextField(
          controller: widget.textCtrl,
          textInputAction: widget.action,
          decoration: InputDecoration(
            prefixIcon: Icon(
              size: 20,
              widget.icon,
              color: widget.iconColor,
            ),
            border: InputBorder.none,
            contentPadding: widget.contentPadding,
            hintText: widget.hint,
            hintStyle: widget.hintStyle,
          ),
        ),
      );
}
