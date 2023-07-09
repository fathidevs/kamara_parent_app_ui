import 'package:flutter/material.dart';

class Shadows {
  static BoxShadow elevatedTextField() {
    return const BoxShadow(
        color: Colors.black12, spreadRadius: 0.1, blurRadius: 10.0);
  }

  static BoxShadow bsd() {
    return const BoxShadow(
        color: Colors.black12, spreadRadius: 0.1, blurRadius: 15.5);
  }

  static BoxShadow mainImgThumbnail() {
    return const BoxShadow(
        color: Colors.black12, spreadRadius: 0.1, blurRadius: 5.5);
  }

  static BoxShadow mainNavigationBar() {
    return const BoxShadow(
        color: Colors.black12, spreadRadius: 0.1, blurRadius: 15.0);
  }
}

class Radis {
  static BorderRadius bsd() {
    return const BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    );
  }
}
