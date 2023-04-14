import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';

import 'package:kamara_parent_app_ui/custom_widgets/txt_icon_btn1.dart';

class ListItem3 extends StatefulWidget {
  final List<Widget> data;
  final double elevation;
  final String title;
  final String msg;
  final EdgeInsets padding;

  const ListItem3({
    Key? key,
    required this.data,
    this.elevation = 5.0,
    required this.title,
    this.msg = "",
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  }) : super(key: key);

  @override
  State<ListItem3> createState() => _ListItem3State();
}

class _ListItem3State extends State<ListItem3> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 18.0, left: 20.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                      color: MyColors.colorPrimary),
                )),
            Card(
              shadowColor: Colors.black26,
              elevation: widget.elevation,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: widget.data,
                ),
              ),
            ),
            Padding(
              // alignment: Alignment.centerRight,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.msg,
                      style: const TextStyle(color: Colors.red, fontSize: 11),
                    ),
                  ),
                  TxtIconBtn(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: MyColors.colorPrimary,
                    ),
                    label: const Text(
                      "view all",
                      style: TextStyle(
                        color: MyColors.colorPrimary,
                        fontWeight: FontWeight.bold,
                        // fontSize: 15.0,
                      ),
                    ),
                  ).noSplash(reversed: true),
                ],
              ),
            )
          ],
        ),
      );
}
