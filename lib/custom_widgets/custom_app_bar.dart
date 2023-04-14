import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';

class CustomAppBar {
  final BuildContext cx;
  final IconData leadingIcon;
  final String title;
  final List<Widget> actions;
  const CustomAppBar({
    this.leadingIcon = Icons.arrow_drop_down_rounded,
    required this.cx,
    required this.title,
    required this.actions,
  });
  PreferredSizeWidget flat() => AppBar(
        elevation: 0.0,
        backgroundColor: MyColors.colorOnPrimary,
        leading: IconButton(
          splashRadius: 0.1,
          icon: Icon(
            leadingIcon,
            color: MyColors.colorPrimary,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.of(cx).pop();
          },
        ),
        title: Text(
          title,
          style: const TextStyle(color: MyColors.colorPrimary),
        ),
        actions: actions,
      );
}
