import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/screens/settings.dart';

class ElevatedTextField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsets margin;
  final EdgeInsets contentPadding;
  final double radius;
  final Color background;
  final TextStyle hintStyle;
  final TextInputAction action;
  final bool secure;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color iconColor;
  final String hintText;
  final TextInputType textInputType;

  const ElevatedTextField({
    Key? key,
    this.controller,
    this.margin = const EdgeInsets.symmetric(horizontal: 35.0),
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
    this.radius = 19.0,
    this.background = MyColors.colorOnPrimary,
    required this.hintStyle,
    this.action = TextInputAction.done,
    this.secure = true,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor = MyColors.colorPrimary,
    required this.hintText,
    this.textInputType = TextInputType.none,
  }) : super(key: key);

  @override
  State<ElevatedTextField> createState() => _TextField1StatPe();
}

class _TextField1StatPe extends State<ElevatedTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.background,
          boxShadow: [
            Shadows.elevatedTextField(),
          ]),
      child: Theme(
        data: themeData(context, widget.iconColor),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: TextField(
            controller: widget.controller,
            textInputAction: widget.action,
            keyboardType: widget.textInputType,
            obscureText: widget.secure,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              border: InputBorder.none,
              contentPadding: widget.contentPadding,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
            ),
          ),
        ),
      ),
    );
  }
}

ThemeData themeData(BuildContext context, Color focusedColor,
    {Color unfocusedColor = Colors.grey}) {
  return Theme.of(context).copyWith(
    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
      iconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.focused)) {
          return focusedColor;
        }
        if (states.contains(MaterialState.error)) {
          return Colors.red;
        }
        return unfocusedColor;
      }),
    ),
  );
}
