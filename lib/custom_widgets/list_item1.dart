import 'package:flutter/material.dart';

class ListItem1 extends StatelessWidget {
  final Widget thumbnail;
  final Widget title;
  final Widget button;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  const ListItem1({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.button,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: onPressed,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: thumbnail,
                  ),
                  Flexible(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: title,
                      )),
                  Flexible(
                    flex: 2,
                    child: button,
                  ),
                ]),
          ),
        ),
      );
}
