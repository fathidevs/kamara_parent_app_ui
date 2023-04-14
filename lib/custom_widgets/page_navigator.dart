import 'package:flutter/material.dart';

class PageNavigator {
  final BuildContext cx;
  final Widget navigateTo;
  final Offset direction;
  final Curve curve;
  const PageNavigator({
    required this.cx,
    required this.navigateTo,
    this.direction = const Offset(0.0, 1.0),
    this.curve = Curves.easeInOutCubic,
  });
  go() => Navigator.of(cx).push(_route());

  Route _route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return navigateTo;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = direction;
        Offset end = Offset.zero;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
