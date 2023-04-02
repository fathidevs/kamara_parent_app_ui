import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/custom_widgets/btn1.dart';
import 'package:kamara_parent_app_ui/custom_widgets/tex_field1.dart';
import 'package:kamara_parent_app_ui/screens/main_screens/main_holder.dart';

import '../auth.dart';
import '../custom_widgets/txt_field_p1.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: MyColors.colorPrimary,
      home: Scaffold(
          body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _header(context),
          const Body(),
        ],
      )),
    );
  }
}

Widget _header(BuildContext cx) {
  return SizedBox(
    height: MediaQuery.of(cx).size.height * .5,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "PARENT",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25.0),
          ),
        ),
        Image.asset(
          "assets/logo/Kamara.png",
          width: MediaQuery.of(cx).size.width * .6,
        ),
      ],
    ),
  );
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _emailCtr = TextEditingController();
  final _passCtr = TextEditingController();
  bool _tgl = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextField1(
          textCtrl: _emailCtr,
          action: TextInputAction.next,
          hint: "Email",
          hintStyle: const TextStyle(color: MyColors.colorSecondary50),
          icon: Icons.alternate_email_rounded,
          iconColor: MyColors.colorSecondary,
        ),
        const Divider(
          color: Colors.transparent,
          height: 25.0,
        ),
        TextFieldP1(
          iconColor: MyColors.colorSecondary,
          textCtrl: _passCtr,
          hintStyle: const TextStyle(color: MyColors.colorSecondary50),
          secure: _tgl,
          toggle: () {
            setState(() {
              _tgl = !_tgl;
            });
          },
        ),
        const Divider(
          color: Colors.transparent,
          height: 50.0,
        ),
        Btn1(
          backgroundColor: MyColors.colorOnPrimary,
          onPressed: () {
            if (_emailCtr.text.trim().isNotEmpty) {
              setState(() {
                Auth.set(_emailCtr.text.trim());
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainHolder(),
                    ));
              });
            }
          },
          child: const Text(
            "Login",
            style: TextStyle(color: MyColors.colorSecondary),
          ),
        ),
        const Divider(
          color: Colors.transparent,
          height: 45.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 55.0),
          child: TextButton(
            onPressed: () {},
            child: const Text("Don't have an account? contact us"),
          ),
        ),
      ],
    );
  }
}
