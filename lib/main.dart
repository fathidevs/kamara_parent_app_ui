import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/notifier/main_current_page_index_notifier.dart';
import 'package:kamara_parent_app_ui/notifier/picked_calendar_date_notifier.dart';
import 'package:kamara_parent_app_ui/notifier/picked_calendar_type_notifier.dart';
import 'package:kamara_parent_app_ui/notifier/picked_child_id_notifier.dart';
import 'package:provider/provider.dart';

import 'auth.dart';
import 'init.dart';
import 'screens/login.dart';
import 'screens/main_screens/main_holder.dart';
import 'theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => PickedChildIdNotifier(),
      ),
      ChangeNotifierProvider(
        create: (_) => PickedCalendarTypeNotifier(),
      ),
      ChangeNotifierProvider(
        create: (_) => PickedCalendarDateNotifier(),
      ),
      ChangeNotifierProvider(
        create: (_) => MainCurrentPageIndexNotifier(),
      ),
    ],
    child: const KamaraParentApp(),
  ));
}

class KamaraParentApp extends StatefulWidget {
  const KamaraParentApp({Key? key}) : super(key: key);

  @override
  State<KamaraParentApp> createState() => _KamaraParentAppState();
}

class _KamaraParentAppState extends State<KamaraParentApp> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Init.app(context);
    PageController pageController = PageController(initialPage: currentIndex);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.get(),
      home: Scaffold(
        body: FutureBuilder<bool>(
            future: Auth.check(),
            builder: (cx, snapshot) {
              if (snapshot.hasData && snapshot.data!) {
                return MainHolder(
                  pageController: pageController,
                  onPageChanged: (val) {
                    setState(() {
                      currentIndex = val;
                    });
                  },
                );
              }
              return const Login();
            }),
        // bottomNavigationBar: MainNavigationBar(
        //   currentIndex: currentIndex,
        //   onTap: (val) {
        //     setState(() {
        //       currentIndex = val;
        //       pageController.jumpToPage(val);
        //     });
        //   },
        //   buttons: [
        //     FloatingNavbarItem(icon: Icons.home_rounded),
        //     FloatingNavbarItem(icon: Icons.home_rounded),
        //     FloatingNavbarItem(icon: Icons.home_rounded),
        //   ],
        // ),
      ),
    );
  }
}
