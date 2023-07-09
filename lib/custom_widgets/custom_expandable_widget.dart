import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';

class CustomExpandableWidget extends StatefulWidget {
  final double maxHeight;
  final double minHeight;
  final double width;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Duration duration;
  final Curve curves;
  final List<BoxShadow> boxShadow;
  final bool toggleChildVisibility;
  final Widget child;

  const CustomExpandableWidget({
    Key? key,
    required this.maxHeight,
    required this.minHeight,
    required this.width,
    this.padding =
        const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0, top: 15.0),
    this.backgroundColor = MyColors.colorOnPrimary,
    this.duration = const Duration(milliseconds: 250),
    this.curves = Curves.easeInOutCubic,
    this.boxShadow = const [
      BoxShadow(
        color: MyColors.bsdShadow,
        blurRadius: 15.0,
      ),
    ],
    this.toggleChildVisibility = false,
    required this.child,
  }) : super(key: key);

  @override
  State<CustomExpandableWidget> createState() => _CustomExpandableWidgetState();
}

class _CustomExpandableWidgetState extends State<CustomExpandableWidget> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * .07,
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: onTap,
            onVerticalDragUpdate: (DragUpdateDetails details) =>
                onVerticalDragUpdate(details),
            child: const CustomExpandableWidgetHandler(),
          ),
        ),
        AnimatedContainer(
          duration: widget.duration,
          curve: widget.curves,
          height: isOpen ? widget.maxHeight : widget.minHeight,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: widget.boxShadow,
          ),
          child: Column(
            children: [
              // flex: isOpen ? 1 : 2,

              Expanded(
                  flex: 4,
                  child: AnimatedOpacity(
                    duration: Duration(
                        milliseconds: widget.duration.inMilliseconds - 100),
                    curve: widget.curves,
                    opacity: widget.toggleChildVisibility
                        ? isOpen
                            ? 1.0
                            : 0.0
                        : 1.0,
                    child: Container(
                      margin: widget.padding,
                      child: widget.child,
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  void onTap() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      isOpen = details.primaryDelta! < 0;
    });
  }
}

class CustomExpandableWidgetHandler extends StatelessWidget {
  final Color color;
  const CustomExpandableWidgetHandler({
    Key? key,
    this.color = MyColors.colorPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      // click detecting area
      SizedBox(
        // height: MediaQuery.of(context).size.width * .01,
        width: MediaQuery.of(context).size.width * .4,
        child: Center(
          // the actual handler
          child: Container(
            // height: 6.0,
            width: MediaQuery.of(context).size.width * .3,
            margin: EdgeInsets.only(bottom: 8.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(300.0),
            ),
          ),
        ),
      );
}
