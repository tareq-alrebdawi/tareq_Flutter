import 'package:flutter/material.dart';
import 'package:flutterui/Screens/Login_Screen/Components/Login_Content.dart';
import 'package:flutterui/Screens/Login_Screen/animations/change_screen_animation.dart';
import 'package:flutterui/Utils/helpor_functions.dart';
import '../../../Utils/constants.dart';

class BottomText extends StatefulWidget {
  // final Screens screen;
  // required this.screen
  const BottomText({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomText> createState() => _BottomTextState();
}

class _BottomTextState extends State<BottomText> {
  @override
  void initState() {
    ChangeScreenAnimation.bottomTextAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HeloperFunction.WrapWithAnimatedBuilder(
      animation: ChangeScreenAnimation.bottomTextAnimation,
      child: GestureDetector(
        onTap: () {
          if (!ChangeScreenAnimation.isPlaying) {
            ChangeScreenAnimation.currentScreen == Screens.creatAccount
                ? ChangeScreenAnimation.forward()
                : ChangeScreenAnimation.reverse();
            ChangeScreenAnimation.currentScreen =
                Screens.values[1 - ChangeScreenAnimation.currentScreen.index];
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: RichText(
            text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                ),
                children: [
                  // TextSpan(
                  //   text: widget.screen == Screens.creatAccount
                  //       ? 'Alredy have an account? '
                  //       : 'Don\t have an account?',
                  //   style: const TextStyle(
                  //     color: KPrimaryColor,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  TextSpan(
                    text: ChangeScreenAnimation.currentScreen ==
                            Screens.creatAccount
                        ? 'Alredy have an account? '
                        : 'Don\t have an account?',
                    style: const TextStyle(
                      color: KPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ChangeScreenAnimation.currentScreen ==
                            Screens.creatAccount
                        ? 'Log In '
                        : 'Sign Up',
                    style: const TextStyle(
                      color: KSecoundryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // TextSpan(
                  //   text: widget.screen == Screens.creatAccount ? 'Log In ' : 'Sign Up',
                  //   style: const TextStyle(
                  //     color: KSecoundryColor,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ]),
          ),
        ),
      ),
    );
  }
}
