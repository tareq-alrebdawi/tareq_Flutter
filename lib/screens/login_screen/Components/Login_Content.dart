import 'package:flutter/material.dart';
import 'package:flutterui/Screens/Login_Screen/Components/bottom_text.dart';
import 'package:flutterui/Screens/Login_Screen/animations/change_screen_animation.dart';
import 'package:flutterui/Utils/helper_functions.dart';
import 'package:flutterui/screens/login_screen/Components/Top_text.dart';
import 'package:ionicons/ionicons.dart';

import '../../../Utils/constants.dart';

enum Screens {
  createAccount,
  welcomeBack,
}

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with TickerProviderStateMixin {
  late final List<Widget> createAccountContent;
  late final List<Widget> loginContent;

  @override
  void initState() {
    createAccountContent = [
      inputField('Name', Ionicons.person_outline),
      inputField('E-mail', Ionicons.mail_outline),
      inputField('Password', Ionicons.lock_closed),
      loginButton('Sign Up'),
      orDivider(),
      logos(),
    ];
    loginContent = [
      inputField('E-mail', Ionicons.mail_outline),
      inputField('Password', Ionicons.lock_closed),
      loginButton('Log In'),
      forgotPassword(),
    ];

    ChangeScreenAnimation.initialize(
      vsync: this,
      createAccountItems: createAccountContent.length,
      loginItems: loginContent.length,
    );
    for (var i = 0; i < createAccountContent.length; i++) {
      createAccountContent[i] = HelperFunction.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.createAccountAnimations[i],
        child: createAccountContent[i],
      );
    }

    for (var i = 0; i < loginContent.length; i++) {
      loginContent[i] = HelperFunction.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.loginAnimations[i],
        child: loginContent[i],
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    ChangeScreenAnimation.dispose();
    super.dispose();
  }

  // Create TextField
  Widget inputField(String hint, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
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

  // Create login button method
  // Widget loginButton(String title) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
  //     child: ElevatedButton(
  //       onPressed: () {},
  //       style: ElevatedButton.styleFrom(
  //         padding: const EdgeInsets.symmetric(vertical: 14),
  //         shape: const StadiumBorder(),
  //         backgroundColor: KSecondaryColor,
  //         elevation: 8,
  //         shadowColor: Colors.black87,
  //       ),
  //       child: Text(
  //         title,
  //         style: const TextStyle(
  //           fontSize: 18,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Create orDivider
  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: KPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
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
            ),
          )
        ],
      ),
    );
  }

  // Create logos
  Widget logos() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/face.png',
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 30),
          Image.asset(
            'images/google.png',
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }

  // Create forgotPassword
  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: KSecondaryColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 136,
          left: 24,
          child: TopText(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createAccountContent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: loginContent,
              ),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: BottomText(),
          ),
        ),
      ],
    );
  }
}
