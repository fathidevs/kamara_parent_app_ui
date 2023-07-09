import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/screens/settings.dart';

class TextFieldP1 extends StatefulWidget {
  final TextEditingController? textCtrl;
  final EdgeInsets margin;
  final EdgeInsets contentPadding;
  final double radius;
  final Color background;
  final TextStyle hintStyle;
  final TextInputAction action;
  final bool secure;
  final VoidCallback? toggle;
  final Color iconColor;
  final double iconSize;

  const TextFieldP1({
    Key? key,
    this.textCtrl,
    this.margin = const EdgeInsets.symmetric(horizontal: 35.0),
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
    this.radius = 19.0,
    this.background = MyColors.colorOnPrimary,
    this.hintStyle = const TextStyle(
      color: MyColors.colorPrimary50,
    ),
    this.action = TextInputAction.done,
    this.secure = true,
    this.toggle,
    this.iconColor = MyColors.colorPrimary,
    this.iconSize = 20.0,
  }) : super(key: key);

  @override
  State<TextFieldP1> createState() => _TextField1StatPe();
}

class _TextField1StatPe extends State<TextFieldP1> {
  @override
  Widget build(BuildContext context) => Container(
        margin: widget.margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.background,
            boxShadow: [
              Shadows.elevatedTextField(),
            ]),
        child: TextField(
          controller: widget.textCtrl,
          textInputAction: widget.action,
          obscureText: widget.secure,
          decoration: InputDecoration(
            prefixIcon: Icon(
              size: widget.iconSize,
              Icons.password_rounded,
              color: widget.iconColor,
            ),
            suffixIcon: IconButton(
              splashRadius: 1.0,
              icon: Icon(
                widget.secure
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                color: widget.iconColor,
                size: widget.iconSize,
              ),
              onPressed: widget.toggle,
            ),
            border: InputBorder.none,
            contentPadding: widget.contentPadding,
            hintText: "Password",
            hintStyle: widget.hintStyle,
          ),
        ),
      );
}
