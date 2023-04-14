import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/notifier/picked_calendar_date.dart';
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
        create: (_) => PickedCalendarDate(),
      )
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
  @override
  Widget build(BuildContext context) {
    Init.app(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.get(),
      home: Scaffold(
        body: FutureBuilder<bool>(
            future: Auth.check(),
            builder: (cx, snapshot) {
              if (snapshot.hasData && snapshot.data!) {
                return const MainHolder();
              }
              return const Login();
            }),
      ),
    );
  }
}
