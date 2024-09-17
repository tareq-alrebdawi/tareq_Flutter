import 'package:flutter/material.dart';
import 'package:flutterui/Screens/Login_Screen/Components/Login_Content.dart';
import 'package:flutterui/Screens/Login_Screen/animations/change_screen_animation.dart';
import 'package:flutterui/Utils/helpor_functions.dart';

class TopText extends StatefulWidget {
  // final Screens screen;
  // required this.screen
  const TopText({
    Key? key,
  }) : super(key: key);

  @override
  State<TopText> createState() => _TopTextState();
}

class _TopTextState extends State<TopText> {
  @override
  void initState() {
    ChangeScreenAnimation.topTextAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Text(
    //   widget.screen == Screens.creatAccount ? 'Create\nAccount' : 'Welcome\nBack',
    //   style: const TextStyle(
    //     fontSize: 40,
    //     fontWeight: FontWeight.w600,
    //   ),
    // );old
    return HeloperFunction.WrapWithAnimatedBuilder(
      child: Text(
        ChangeScreenAnimation.currentScreen == Screens.creatAccount
            ? 'Create\nAccount'
            : 'Welcome\nBack',
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
      ),
      animation: ChangeScreenAnimation.topTextAnimation,
    );
  }
}
