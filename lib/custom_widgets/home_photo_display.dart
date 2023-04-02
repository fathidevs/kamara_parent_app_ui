import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/custom_widgets/txt_icon_btn1.dart';

import 'display_photo1.dart';

class HomePhotoDisplay extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget img;
  final Color btnColor;
  final String name;
  const HomePhotoDisplay({
    Key? key,
    required this.onPressed,
    required this.img,
    this.btnColor = MyColors.colorPrimary,
    required this.name,
  }) : super(key: key);

  @override
  State<HomePhotoDisplay> createState() => _HomePhotoDisplayState();
}

class _HomePhotoDisplayState extends State<HomePhotoDisplay> {
  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: kToolbarHeight * 2,
            child: DisplayPhoto(
              img: widget.img,
            ),
          ),
          TxtIConBtn1(
              onPressed: widget.onPressed,
              icon: Icon(
                Icons.arrow_drop_up_rounded,
                color: widget.btnColor,
                size: 22.0,
              ),
              label: Text(_nameOptimizer(widget.name),
                  style: TextStyle(color: widget.btnColor, fontSize: 14.0)))
        ],
      );
}

String _nameOptimizer(String name) {
  if (name.split(" ").length > 1) {
    String fn = name.split(" ")[0];
    String sn = name.split(" ")[1].characters.string[0];
    return "$fn $sn.";
  }
  return name;
}
