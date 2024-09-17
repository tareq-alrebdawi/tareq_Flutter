import 'package:flutter/material.dart';
import 'package:flutterui/Screens/Login_Screen/Components/Login_Content.dart';

class ChangeScreenAnimation {
  static late final AnimationController topTextController;
  static late final Animation<Offset> topTextAnimation;

  static late final AnimationController bottomTextController;
  static late final Animation<Offset> bottomTextAnimation;

  static final List<AnimationController> createAccountController = [];
  static final List<Animation<Offset>> createAccountAnimations = [];

  static final List<AnimationController> loginController = [];
  static final List<Animation<Offset>> loginAnimations = [];
  static bool isPlaying = false;
  static Screens currentScreen = Screens.creatAccount;
  static Animation<Offset> _createAnimation({
    required Offset begin,
    required Offset end,
    required AnimationController parent,
  }) {
    return Tween(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: parent,
        curve: Curves.easeInOut,
      ),
    );
  }

  static void dispose() {
    
    bottomTextController.dispose();
    topTextController.dispose();
    for (final controller in [
      topTextController,
      bottomTextController,
      ...createAccountController,
      ...loginController,
    ]) {
      controller.dispose();
    }
  } //end method dispose

  static Future<void> forward() async {
    isPlaying = true;
    topTextController.forward();
    await bottomTextController.forward();
    for (final controller in [
      ...createAccountController,
      ...loginController,
    ]) {
      controller.forward();
      await Future.delayed(
        const Duration(milliseconds: 100),
      );
    }
    bottomTextController.reverse();
    await topTextController.reverse();
    isPlaying = false;
  }

  static Future<void> reverse() async {
    isPlaying = true;
    topTextController.forward();
    await bottomTextController.forward();
    for (final controller in [
      ...loginController.reversed,
      ...createAccountController.reversed,
    ]) {
      controller.reverse();
      await Future.delayed(
        const Duration(milliseconds: 100),
      );
    }
    bottomTextController.reverse();
    await topTextController.reverse();
    isPlaying = false;
  }

  static void initialize({
    required TickerProvider vsync,
    required int createAccountItems,
    required int loginItems,
  }) {
    for (var i = 0; i < createAccountItems; i++) {
      createAccountController.add(
        AnimationController(
          vsync: vsync,
          duration: const Duration(microseconds: 200),
        ),
      );
      createAccountAnimations.add(
        _createAnimation(
          begin: Offset.zero,
          end: const Offset(-1, 0),
          parent: createAccountController[i],
        ),
      );
    }
    for (var i = 0; i < loginItems; i++) {
      loginController.add(
        AnimationController(
          vsync: vsync,
          duration: const Duration(microseconds: 200),
        ),
      );
      loginAnimations.add(
        _createAnimation(
          begin: Offset(1, 0),
          end: Offset.zero,
          parent: loginController[i],
        ),
      );
    }
    topTextController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 200),
    );
    topTextAnimation = _createAnimation(
      begin: Offset.zero,
      parent: topTextController,
      end: const Offset(-1.2, 0),
    );
    bottomTextController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 200),
    );
    bottomTextAnimation = _createAnimation(
      begin: Offset.zero,
      parent: bottomTextController,
      end: const Offset(0, 1.7),
    );
  } // end method initialize
}//end class ChangeScreenAnimation
