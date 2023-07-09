import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kamara_parent_app_ui/attendance_feedback.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/custom_widgets/custom_app_bar.dart';
import 'package:kamara_parent_app_ui/custom_widgets/custom_expandable_widget.dart';
import 'package:kamara_parent_app_ui/custom_widgets/txt_icon_btn1.dart';
import 'package:kamara_parent_app_ui/notifier/picked_calendar_date_notifier.dart';
import 'package:kamara_parent_app_ui/notifier/picked_calendar_type_notifier.dart';
import 'package:kamara_parent_app_ui/notifier/picked_child_id_notifier.dart';
import 'package:provider/provider.dart';

import '../calendar_data/calendar.dart';
import '../custom_widgets/calendar_navigator.dart';
import '../custom_widgets/custom_card.dart';
import '../custom_widgets/full_list_of_days.dart';

class CalendarFull extends StatelessWidget {
  const CalendarFull({Key? key}) : super(key: key);

  // button to change the calendar from/to gregorian
  Widget changeCalendarType() {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        bool isGregorian =
            Provider.of<PickedCalendarTypeNotifier>(context, listen: false)
                .isGregorian;
        return TxtIconBtn(
          padding: const EdgeInsets.only(right: 15.0, top: 5.0, bottom: 5.0),
          onPressed: () {
            setState.call(() {
              Provider.of<PickedCalendarTypeNotifier>(context, listen: false)
                  .changeType();
            });
          },
          icon: const Icon(
            Icons.change_circle_rounded,
            color: MyColors.colorPrimary,
          ),
          label: Text(
            isGregorian ? "Gregorian" : "Ethiopian",
            style: const TextStyle(
                color: MyColors.colorPrimary, fontWeight: FontWeight.bold),
          ),
        ).noSplash(reversed: true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(cx: context, title: "Calendar", actions: [
          // changeCalendarType(),
        ]).flat(),
        body: const SafeArea(child: CalendarBody()),
        // bottomSheet: CalendarBottomSheet(dateTime: pickedDate(true).dateTime),
      ),
    );
  }
}

class CalendarBody extends StatefulWidget {
  const CalendarBody({
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  DateTime _dateTime = Calendar.nowNt();
  @override
  Widget build(BuildContext context) {
    int id = Provider.of<PickedChildIdNotifier>(context).id;

    PickedCalendarDateNotifier pickedDate(bool listen) =>
        Provider.of<PickedCalendarDateNotifier>(context, listen: listen);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              CalendarNavigator(
                onMonthChanged: (dateTime) {
                  setState(() => _dateTime = dateTime);
                  pickedDate(false).changeDate(dateTime);
                },
              ),
              FullListOfDays(
                id: id,
                dateTime: _dateTime,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: CustomExpandableWidget(
            maxHeight: MediaQuery.of(context).size.width * .3,
            minHeight: MediaQuery.of(context).size.width * .1,
            width: MediaQuery.of(context).size.width * .95,
            toggleChildVisibility: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Jiffy(pickedDate(true).dateTime)
                              .format("MMMM dd, yy"),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                      const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AttendanceFeedbackWidget(),
                      )),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    borderRadius: BorderRadius.circular(15.0),
                    child: const Center(child: Text("No Events!")),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
