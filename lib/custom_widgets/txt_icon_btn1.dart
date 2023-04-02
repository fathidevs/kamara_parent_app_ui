import 'package:flutter/material.dart';

class TxtIConBtn1 extends StatefulWidget {
  final VoidCallback onPressed;
  final Icon icon;
  final Text label;
  final EdgeInsets padding;
  final double radius;

  const TxtIConBtn1({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.padding = const EdgeInsets.only(left: 15.0),
    this.radius = 5.0,
  }) : super(key: key);

  @override
  State<TxtIConBtn1> createState() => _TxtIConBtn1State();
}

class _TxtIConBtn1State extends State<TxtIConBtn1> {
  @override
  Widget build(BuildContext context) => Container(
        margin: widget.padding,
        child: InkWell(
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(widget.radius),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: widget.label,
              ),
              widget.icon,
            ],
          ),
        ),
      );
}
