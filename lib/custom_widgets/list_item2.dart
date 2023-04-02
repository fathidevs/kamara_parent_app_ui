import 'package:flutter/material.dart';

class ListItem2 extends StatelessWidget {
  final Icon icon;
  final Text title;
  final EdgeInsets margin;
  final EdgeInsets padding;
  const ListItem2({
    Key? key,
    required this.icon,
    required this.title,
    this.margin = const EdgeInsets.symmetric(vertical: 10.0),
    this.padding = const EdgeInsets.symmetric(vertical: 10.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {},
        child: Container(
          margin: margin,
          // padding: padding,
          child: Row(
            children: [
              Expanded(flex: 1, child: icon),
              Expanded(flex: 3, child: title),
            ],
          ),
        ),
      );
}
