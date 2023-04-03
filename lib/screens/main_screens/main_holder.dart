import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/custom_widgets/bottom_sheet_dialog.dart';
import 'package:kamara_parent_app_ui/custom_widgets/icon_btn1.dart';

import '../../custom_widgets/list_item2.dart';
import 'home.dart';
import 'messages.dart';
import 'profile.dart';

class MainHolder extends StatefulWidget {
  const MainHolder({Key? key}) : super(key: key);

  @override
  State<MainHolder> createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      /*
             SafeArea widget is to prevent ListView items
             in the children[] showing up in statusbar
        */
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: PageView(
              padEnds: false,
              pageSnapping: true,
              physics: const PageScrollPhysics(),
              children: _screens(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconBtn1(
                  onPressed: () {
                    BottomSheetDialog(
                      cx: context,
                      header: const DialogHeader(
                              // padding: EdgeInsets.only(bottom: 0.0, top: 0.0),
                              )
                          .floatingPull(),
                    ).regular(_mainNavMenu());
                  },
                  child: const Icon(
                    Icons.menu_rounded,
                    size: 29.0,
                    color: MyColors.colorPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> _screens() => [
      const Home(),
      const Messages(),
      const Profile(),
    ];
Widget _mainNavMenu() {
  return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _menuItems.length,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      itemBuilder: (cx, position) {
        return _menuItems[position];
      });
}

List<Widget> _menuItems = [
  _title("My children"),
  const ListItem2(
    icon: Icon(Icons.child_care_rounded),
    title: Text("My children's port"),
  ),
  const ListItem2(
    icon: Icon(Icons.person_add_rounded),
    title: Text("Invite parent/guardian"),
  ),
  _title("School"),
  const ListItem2(
    icon: Icon(Icons.account_balance_rounded),
    title: Text("Accounts"),
  ),
  const ListItem2(
    icon: Icon(Icons.calendar_today_rounded),
    title: Text("Calendar"),
  ),
];
Widget _title(String title) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 35.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
            color: MyColors.colorPrimary),
      ),
    );
