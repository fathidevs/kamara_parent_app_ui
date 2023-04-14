import 'package:flutter/material.dart';
import 'package:icon_animated/animated_icons.dart';
import 'package:kamara_parent_app_ui/calendar_data/calendar.dart';
import 'package:kamara_parent_app_ui/custom_widgets/btn1.dart';
import 'package:kamara_parent_app_ui/custom_widgets/calendar_day_card.dart';
import 'package:kamara_parent_app_ui/custom_widgets/page_navigator.dart';
import 'package:kamara_parent_app_ui/custom_widgets/scaff_msg.dart';
import 'package:kamara_parent_app_ui/custom_widgets/txt_icon_anim1.dart';
import 'package:kamara_parent_app_ui/notifier/picked_calendar_date.dart';
import 'package:kamara_parent_app_ui/screens/calendar_full.dart';
import 'package:provider/provider.dart';

import '../colors.dart';

class HomeCalendar extends StatefulWidget {
  final String title;
  final int id;

  const HomeCalendar({
    Key? key,
    this.title = "- Latest\nAttendance",
    required this.id,
  }) : super(key: key);

  @override
  State<HomeCalendar> createState() => _HomeCalendarState();
}

class _HomeCalendarState extends State<HomeCalendar> {
  bool _lastWeek = false;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                    color: MyColors.colorPrimary),
              )),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
            child: CalendarBody(
              id: widget.id,
              lastWeek: _lastWeek,
            ),
          ),
          HomeCalendarController(
            onReversed: (lastWeek) => setState(() => _lastWeek = lastWeek),
          )
        ]);
  }
}

class CalendarBody extends StatefulWidget {
  final bool lastWeek;
  final int id;
  const CalendarBody({
    Key? key,
    required this.lastWeek,
    required this.id,
  }) : super(key: key);

  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _checkAnimationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _checkAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _checkAnimationController, curve: Curves.easeInOutCirc));
    super.initState();
  }

  final int duration = 2000;
  @override
  Widget build(BuildContext context) {
    // the order number of current day
    int wd = Calendar.now.weekday - 1;

    // 7 days to subtract when "Last Week toggled"
    int lw = widget.lastWeek ? 7 : 0;

    List<Widget> l = List.generate(7, (i) {
      DateTime generatedDateTime =
          Calendar.nowNt().add(Duration(days: (i - wd) - lw));

      return Expanded(
        child: CalendarDayCard(
          fontWeight: Calendar.nowNt() == generatedDateTime
              ? FontWeight.w900
              : FontWeight.normal,
          id: widget.id,
          dateTime: generatedDateTime,
          onPressed: (Map<DateTime, String> status) {
            _checkAnimationController.reverse();
            Future.delayed(Duration(milliseconds: duration ~/ 8), () {
              ScaffoldMsg(
                      cx: context,
                      msg: status[generatedDateTime]!,
                      dateTime: generatedDateTime)
                  .showCustomFloating(
                      iconType: status[generatedDateTime]!.contains("p")
                          ? IconType.check
                          : IconType.fail,
                      shadowColor: MyColors.colorPrimary.withOpacity(0.3),
                      backgroundColor: MyColors.colorPrimary,
                      textStyle: const TextStyle(
                          color: MyColors.colorOnPrimary, fontSize: 16.0),
                      animationController: _checkAnimationController,
                      animation: _animation,
                      duration: Duration(milliseconds: duration));
            });
          },
        ),
      );
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: l,
    );
  }
}

class HomeCalendarController extends StatefulWidget {
  final Function onReversed;
  const HomeCalendarController({
    Key? key,
    required this.onReversed,
  }) : super(key: key);

  @override
  State<HomeCalendarController> createState() => _HomeCalendarControllerState();
}

class _HomeCalendarControllerState extends State<HomeCalendarController> {
  bool _reverse = false;
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Btn1(
            // margin: 30.0,
            radius: 10.0,
            elevation: 0.0,
            shadowColor: Colors.transparent,
            backgroundColor: MyColors.colorOnPrimary,
            onPressed: () {
              setState(() {
                _reverse = !_reverse;
                widget.onReversed(_reverse);
              });
            },
            child: TxtIconAnim1(
              txtBefore: "Last week",
              iconBefore: Icons.keyboard_arrow_left_rounded,
              txtAfter: "This week",
              iconAfter: Icons.keyboard_arrow_right_rounded,
              reverse: _reverse,
            ),
          ),
          Btn1(
            margin: 10.0,
            radius: 10.0,
            elevation: 5.0,
            shadowColor: Colors.black26,
            onPressed: () {
              PageNavigator(cx: context, navigateTo: const CalendarFull()).go();
              Provider.of<PickedCalendarDate>(context, listen: false)
                  .changeDate(Calendar.nowNt());
            },
            child: const Text("More"),
          ),
        ],
      );
}
