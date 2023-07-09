import 'package:flutter/material.dart';
import 'package:kamara_parent_app_ui/colors.dart';
import 'package:kamara_parent_app_ui/custom_widgets/btn1.dart';
import 'package:kamara_parent_app_ui/custom_widgets/elevated_text_field.dart';
import 'package:kamara_parent_app_ui/screens/main_screens/main_holder.dart';

import '../auth.dart';

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
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _header(context),
                const Body(),
              ],
            ),
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
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedTextField(
          secure: false,
          action: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          hintText: "Email",
          controller: _emailCtr,
          hintStyle: const TextStyle(color: MyColors.colorPrimary50),
          prefixIcon: const Icon(Icons.alternate_email_rounded),
        ),
        const Divider(
          color: Colors.transparent,
          height: 25.0,
        ),
        ElevatedTextField(
          secure: _hidePassword,
          action: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          hintText: "Password",
          controller: _passCtr,
          hintStyle: const TextStyle(
            color: MyColors.colorPrimary50,
          ),
          prefixIcon: const Icon(Icons.password_rounded),
          suffixIcon: IconButton(
              // color: MyColors.colorPrimary,
              onPressed: () => setState(() => _hidePassword = !_hidePassword),
              icon: _hidePassword
                  ? const Icon(Icons.visibility_off_rounded)
                  : const Icon(Icons.visibility_rounded)),
        ),
        const Divider(
          color: Colors.transparent,
          height: 50.0,
        ),
        Btn1(
          elevation: 10.0,
          shadowColor: Colors.black38,
          backgroundColor: MyColors.colorOnPrimary,
          onPressed: () {
            if (_emailCtr.text.trim().isNotEmpty &&
                _passCtr.text.trim().isNotEmpty) {
              setState(() {
                Auth.set(_emailCtr.text.trim());
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainHolder(
                        pageController: PageController(initialPage: 0),
                        onPageChanged: (v) {},
                      ),
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
