import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';

class IconBtn1 extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double radius;
  final EdgeInsets padding;
  final double elevation;
  final Color shadowColor;
  const IconBtn1(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.radius = 10.0,
      this.padding = const EdgeInsets.all(8.0),
      this.elevation = 4.0,
      this.shadowColor = Colors.black38})
      : super(key: key);

  @override
  State<IconBtn1> createState() => _IconBtn1State();
}

double _elevation = 0.0;

class _IconBtn1State extends State<IconBtn1> {
  @override
  Widget build(BuildContext context) => Card(
        color: MyColors.colorOnPrimary,
        elevation: _elevation,
        shadowColor: widget.shadowColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius)),
        child: GestureDetector(
          onTap: widget.onPressed,

          onTapDown: (_) {
            setState(() {
              _elevation = 5.0;
            });
          },
          onTapUp: (_) {
            setState(() {
              _elevation = 0.0;
            });
          },
          onTapCancel: () {
            setState(() {
              _elevation = 0.0;
            });
          },
          // borderRadius: BorderRadius.circular(widget.radius),
          child: Padding(
            padding: widget.padding,
            child: widget.child,
          ),
        ),
      );
}
