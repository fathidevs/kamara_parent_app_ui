import 'package:flutter/material.dart';

class TitleAndData extends StatelessWidget {
  final String title;
  final String data;
  final bool reversed;
  final double fontSize;
  final bool useForGrades;
  final bool optimizeTitle;
  final Color titleColor;
  final Color dataColor;
  final FontWeight titleWeight;
  const TitleAndData({
    Key? key,
    required this.title,
    required this.data,
    this.reversed = false,
    this.fontSize = 40.0,
    this.useForGrades = false,
    this.optimizeTitle = false,
    this.titleColor = Colors.black87,
    this.dataColor = Colors.black87,
    this.titleWeight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // DATA
        useForGrades
            ? GradeData(data: data, fontSize: fontSize)
            : Text(
                data,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w900,
                    color: dataColor),
              ),
        // TITLE
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            _titleOptimizer(title.toUpperCase()),
            style: TextStyle(
              fontSize: fontSize * .4,
              fontWeight: titleWeight,
              color: titleColor,
            ),
          ),
        ),
      ].reverse(reversed),
    );
  }

  String _titleOptimizer(String title) {
    if (optimizeTitle) {
      if (title.split(' ').length > 1) {
        return title.split(' ').map((e) => '${e[0].toUpperCase()}.').join();
        // return title.split(' ').length.toString();
      }
      if (title.length > 4) {
        return "${title.split('').getRange(0, 4).join()}.";
      }
    }

    return title;
  }
}

extension ListExtension<Widget> on List<Widget> {
  List<Widget> reverse(bool condition) {
    return condition ? reversed.toList() : this;
  }
}

class GradeData extends StatelessWidget {
  final String data;
  final double fontSize;
  final Color dataColor;
  const GradeData({
    Key? key,
    required this.data,
    required this.fontSize,
    this.dataColor = Colors.black87,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
            text: data,
            style: TextStyle(
              color: dataColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w900,
            ),
            children: [
              TextSpan(
                text: "/10",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: fontSize * .8,
                  fontWeight: FontWeight.w900,
                ),
              )
            ]),
      );
}
