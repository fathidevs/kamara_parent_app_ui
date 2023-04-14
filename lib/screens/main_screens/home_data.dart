import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/custom_widgets/home_calendar.dart';
import 'package:kamara_parent_app_ui/dummy_backend/accounts.dart';
import 'package:kamara_parent_app_ui/dummy_backend/grades.dart';
import 'package:kamara_parent_app_ui/tools.dart';

import '../../custom_widgets/list_item3.dart';
import '../../custom_widgets/title_and_data.dart';

class HomeData extends StatefulWidget {
  final int studentId;
  const HomeData({
    Key? key,
    required this.studentId,
  }) : super(key: key);

  @override
  State<HomeData> createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: homeList(widget.studentId).length,
        (cx, position) => homeList(widget.studentId)[position],
      ),
    );
  }
}

Map<String, List<TitleAndData>> dataMap(int id) => {
      "Latest": Grades(id: id)
          .get()
          .where((model) => model.grade != null)
          .map((model) => TitleAndData(
                title: model.subjectName,
                data: model.grade.toString(),
                useForGrades: true,
                optimizeTitle: true,
                fontSize: 30.0,
              ))
          .toList()
          .reverse(true),
      "Balance": [
        TitleAndData(
          title: "Due",
          data: Accounts(id: id).currentMonth().due.toString(),
          fontSize: 31.0,
          titleColor: MyColors.colorPrimary,
          titleWeight: FontWeight.w700,
        ),
        TitleAndData(
          title: "Paid",
          data: Accounts(id: id).currentMonth().paid.toString(),
          fontSize: 31.0,
          titleColor: MyColors.colorPrimary,
          titleWeight: FontWeight.w700,
        ),
        TitleAndData(
          title: "Balance",
          data: Accounts(id: id).currentMonth().balance.toString(),
          fontSize: 31.0,
          titleColor:
              Accounts(id: id).underpaid() ? Colors.red : MyColors.colorPrimary,
          dataColor: Accounts(id: id).underpaid() ? Colors.red : Colors.black87,
          titleWeight: FontWeight.w700,
        ),
      ]
    };
List<Widget> homeList(int id) => [
      const Divider(
        height: 50.0,
        color: Colors.transparent,
      ),
      HomeCalendar(
        id: id,
      ),
      const Divider(
        height: 50.0,
        color: Colors.transparent,
      ),
      ListItem3(
        title: "- Latest\nGrades",
        data: dataMap(id)["Latest"]!.take(3).toList(),
      ),
      const Divider(
        height: 40.0,
        color: Colors.transparent,
      ),
      ListItem3(
        title: "- Balance",
        data: dataMap(id)["Balance"]!,
        msg: Accounts(id: id).underpaid()
            ? "Your Account is \$${Accounts(id: id).requiredPayment()} in debt.\nPlease pay as soon as possible"
            : "",
      ),
      const Divider(
        height: 25.0,
        color: Colors.transparent,
      ),
    ];
