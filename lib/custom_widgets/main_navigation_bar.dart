import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';

class MainNavBar2 extends StatefulWidget {
  final int currentIndex;
  final Function onTap;
  const MainNavBar2(
      {Key? key, required this.currentIndex, required this.onTap(int val)})
      : super(key: key);

  @override
  State<MainNavBar2> createState() => _MainNavBar2State();
}

class _MainNavBar2State extends State<MainNavBar2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 20.0, spreadRadius: 5.0)
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(300.0),
        ),
      ),
      child: FloatingNavbar(
        selectedItemColor: MyColors.colorPrimary,
        selectedBackgroundColor: Colors.transparent,
        unselectedItemColor: MyColors.disabledTextColor,
        backgroundColor: MyColors.colorOnPrimary,
        iconSize: 30.0,
        elevation: 0.0,
        borderRadius: 300.0,
        itemBorderRadius: 300.0,
        width: MediaQuery.of(context).size.width * .55,
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        currentIndex: widget.currentIndex,
        onTap: (int val) => widget.onTap(val),
        items: [
          FloatingNavbarItem(icon: Icons.home),
          FloatingNavbarItem(icon: Icons.email),
          FloatingNavbarItem(icon: Icons.person),
        ],
      ),
    );
  }
}
