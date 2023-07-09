import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/custom_widgets/bottom_sheet_dialog.dart';
import 'package:kamara_parent_app_ui/custom_widgets/icon_btn1.dart';

import '../../custom_widgets/list_item2.dart';
import '../../custom_widgets/main_navigation_bar.dart';
import 'home.dart';
import 'messages.dart';
import 'profile.dart';

class MainHolder extends StatefulWidget {
  final Function onPageChanged;
  final PageController pageController;
  const MainHolder({
    Key? key,
    required this.onPageChanged(int val),
    required this.pageController,
  }) : super(key: key);

  @override
  State<MainHolder> createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    PageController ctrl = PageController(initialPage: currentIndex);
    return SafeArea(
      /*
               SafeArea widget is to prevent ListView items
               in the children[] showing up in statusbar
          */
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // page view
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: PageView(
              onPageChanged: (int value) {
                setState(() => currentIndex = value);
              },
              // controller: widget.pageController,
              controller: ctrl,
              scrollBehavior: const ScrollBehavior(),
              padEnds: false,
              pageSnapping: true,
              physics: const PageScrollPhysics(),
              children: _screens(),
            ),
          ),
          // hamburger menu
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconBtn1(
                  onPressed: () {
                    BottomSheetDialog(
                      cx: context,
                      header: const DialogHeader().floatingPull(),
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
          // bottom nav bar
          Positioned(
            bottom: 25.0,
            child: MainNavBar2(
              currentIndex: currentIndex,
              onTap: (val) => ctrl.animateToPage(val,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInCubic),
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
