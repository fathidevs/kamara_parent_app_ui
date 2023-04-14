import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/tools.dart';

class TxtIconAnim1 extends StatefulWidget {
  final EdgeInsets padding;
  final double radius;
  final IconData iconBefore;
  final IconData iconAfter;
  final String txtBefore;
  final String txtAfter;
  final Color color;
  final bool reverse;
  final double margin;

  const TxtIconAnim1({
    Key? key,
    this.padding = const EdgeInsets.only(left: 15.0),
    this.radius = 5.0,
    required this.iconBefore,
    required this.iconAfter,
    required this.txtBefore,
    required this.txtAfter,
    this.color = MyColors.colorPrimary,
    required this.reverse,
    this.margin = 10.0,
  }) : super(key: key);

  @override
  State<TxtIconAnim1> createState() => _TxtIconBtn2SAnim1();
}

class _TxtIconBtn2SAnim1 extends State<TxtIconAnim1> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      padding: EdgeInsets.only(
          right: widget.reverse
              ? (MediaQuery.of(context).size.width * .1)
              : MediaQuery.of(context).size.width * .1 * .25),
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      width: MediaQuery.of(context).size.width * .35,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widget.reverse
              ? Icon(
                  color: widget.color,
                  widget.iconAfter,
                  size: 17.0,
                )
              : Icon(
                  color: widget.color,
                  widget.iconBefore,
                  size: 17.0,
                ),
          Text(
            widget.reverse ? widget.txtAfter : widget.txtBefore,
            style: TextStyle(color: widget.color),
          ),
        ].reverse(widget.reverse),
      ),
    );
  }
}
