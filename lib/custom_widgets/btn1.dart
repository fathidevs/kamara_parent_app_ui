import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';

class Btn1 extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final double margin;
  final double radius;
  final double elevation;
  final Color shadowColor;

  const Btn1({
    Key? key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = MyColors.colorPrimary,
    this.margin = 45.0,
    this.radius = 15.0,
    this.elevation = 15.0,
    this.shadowColor = Colors.black87,
  }) : super(key: key);

  @override
  State<Btn1> createState() => _Btn1State();
}

class _Btn1State extends State<Btn1> {
  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          color: Colors.transparent,
          margin: EdgeInsets.symmetric(horizontal: widget.margin),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(widget.shadowColor),
                elevation: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return 1.0;
                  } else {
                    return widget.elevation;
                  }
                }),
                backgroundColor:
                    MaterialStateProperty.all(widget.backgroundColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.radius))),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 17.0))),
            child: widget.child,
          ),
        ),
      );
}
