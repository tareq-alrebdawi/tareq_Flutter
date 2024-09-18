import 'package:flutter/material.dart';
import 'package:flutterui/Screens/Login_Screen/Components/bottom_text.dart';
import 'package:flutterui/Screens/Login_Screen/animations/change_screen_animation.dart';
import 'package:flutterui/Utils/helpor_functions.dart';
import 'package:flutterui/screens/login_screen/Components/Top_text.dart';
import 'package:ionicons/ionicons.dart';

import '../../../Utils/constants.dart';

enum Screens {
  creatAccount,
  welcomeBack,
}

class LoginContaint extends StatefulWidget {
  const LoginContaint({Key? key}) : super(key: key);

  @override
  State<LoginContaint> createState() => _LoginContaintState();
}

class _LoginContaintState extends State<LoginContaint>
    with TickerProviderStateMixin {
  late final List<Widget> creatAccountContent;
  late final List<Widget> loginContaint;

  @override
  void initState() {
    creatAccountContent = [
      inputField('Name', Ionicons.person_outline),
      inputField('E-mail', Ionicons.mail_outline),
      inputField('Password', Ionicons.lock_closed),
      LoginButtom('Sign Up'),
      orDivider(),
      logos(),
    ];
    loginContaint = [
      inputField('E-mail', Ionicons.mail_outline),
      inputField('Password', Ionicons.lock_closed),
      LoginButtom('Log In'),
      forgotPassord(),
    ];

    ChangeScreenAnimation.initialize(
      vsync: this,
      createAccountItems: creatAccountContent.length,
      loginItems: loginContaint.length,
    );
    for (var i = 0; i < creatAccountContent.length; i++) {
      creatAccountContent[i] = HeloperFunction.WrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.createAccountAnimations[i],
        child: creatAccountContent[i],
      );
    }

    for (var i = 0; i < loginContaint.length; i++) {
      loginContaint[i] = HeloperFunction.WrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.loginAnimations[i],
        child: loginContaint[i],
      );
    }
    super.initState();
  } //end initState

  @override
  void dispose() {
    ChangeScreenAnimation.dispose();
    super.dispose();
  }

  //creat Textfeild
  Widget inputField(String hint, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 8,
      ),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
          ),
        ),
      ),
    );
  }

// creat login button method
  Widget LoginButtom(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 135,
        vertical: 16,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
         backgroundColor: KSecoundryColor,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

//creat line or line
  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 130,
        vertical: 8,
      ),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: KPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              'Or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
              child: Container(
            height: 1,
            color: KPrimaryColor,
          ))
        ],
      ),
    );
  }

//creat logs imames
  Widget logos() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/face.png',
            width: 30,
            height: 30,
          ),
          SizedBox(
            width: 30,
          ),
          Image.asset(
            'images/google.png',
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }

// creat forgotPassword ....
  Widget forgotPassord() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 110,
      ),
      child: TextButton(
          onPressed: () {},
          child: const Text(
            'Forget Password',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: KSecoundryColor,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // const currentScreen = Screens.creatAccount;
    return Stack(
      children: [
        const Positioned(
          top: 136,
          left: 24,
          // child: TopText( screen: currentScreen), old
          child: TopText(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 100),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: creatAccountContent,
                // children: currentScreen == Screens.creatAccount
                //     ? [
                //         inputField('Name', Ionicons.person_outline),
                //         inputField('E-mail', Ionicons.mail_outline),
                //         inputField('Password', Ionicons.lock_closed),
                //         LoginButtom('Sign Up'),
                //         orDivider(),
                //         logos(),
                //       ]
                //     : [
                //         inputField('E-mail', Ionicons.mail_outline),
                //         inputField('Password', Ionicons.lock_closed),
                //         LoginButtom('Log In'),
                //         forgotPassord(),
                //       ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: loginContaint,
                // children: currentScreen == Screens.creatAccount
                //     ? [
                //         inputField('Name', Ionicons.person_outline),
                //         inputField('E-mail', Ionicons.mail_outline),
                //         inputField('Password', Ionicons.lock_closed),
                //         LoginButtom('Sign Up'),
                //         orDivider(),
                //         logos(),
                //       ]
                //     : [
                //         inputField('E-mail', Ionicons.mail_outline),
                //         inputField('Password', Ionicons.lock_closed),
                //         LoginButtom('Log In'),
                //         forgotPassord(),
                //       ],
              ),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 50,
            ),
            child: BottomText(),
            // child: BottomText(screen:currentScreen ),
          ),
        )
      ],
    );
  }
}
