import 'dart:developer';

import 'package:rive/rive.dart';

import 'animation_enum.dart';

class AnimationControllers {
  static Artboard? riveArtboard;
  static bool isLookRight = false;
  static bool isLookLeft = false;

  static late RiveAnimationController controllerIdle;
  static late RiveAnimationController controllerHandsUp;
  static late RiveAnimationController controllerHandsDown;
  static late RiveAnimationController controllerSuccess;
  static late RiveAnimationController controllerFail;
  static late RiveAnimationController controllerLookDownRight;
  static late RiveAnimationController controllerLookDownLeft;
  static late RiveAnimationController controllerLookIdle;

  static void removeAllControllers() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerHandsUp);
    riveArtboard?.artboard.removeController(controllerHandsDown);
    riveArtboard?.artboard.removeController(controllerSuccess);
    riveArtboard?.artboard.removeController(controllerFail);
    riveArtboard?.artboard.removeController(controllerLookDownRight);
    riveArtboard?.artboard.removeController(controllerLookDownLeft);
    riveArtboard?.artboard.removeController(controllerLookIdle);
    isLookLeft = false;
    isLookRight = false;
  }

  static addIdleController() {
    removeAllControllers();
    riveArtboard!.artboard.addController(controllerIdle);
    log("idle");
  }

  static void addHandsUpController() {
    removeAllControllers();
    riveArtboard!.artboard.addController(controllerHandsUp);
    log("hands up");
  }

  static void addHandsDownController() {
    removeAllControllers();
    riveArtboard!.artboard.addController(controllerHandsDown);
    log("hands down");
  }

  static void addSuccessController() {
    removeAllControllers();
    riveArtboard!.artboard.addController(controllerSuccess);
    log("success");
  }

  static void addFailController() {
    removeAllControllers();
    riveArtboard!.artboard.addController(controllerFail);
    log("fail");
  }

  static void addLookDownRightController() {
    removeAllControllers();
    isLookRight = true;
    riveArtboard!.artboard.addController(controllerLookDownRight);
    log("look down right");
  }

  static void addLookDownLeftController() {
    removeAllControllers();
    isLookLeft = true;
    riveArtboard!.artboard.addController(controllerLookDownLeft);
    log("look down left");
  }

  static void addLookIdleController() {
    removeAllControllers();
    riveArtboard!.artboard.addController(controllerLookIdle);
    log("look idle");
  }

  static void generateControllers() {
    // b3mel controller l kol state mawgoda fl animation

    controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHandsUp = SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerHandsDown = SimpleAnimation(AnimationEnum.hands_down.name);
    controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerFail = SimpleAnimation(AnimationEnum.fail.name);
    controllerLookDownRight =
        SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerLookDownLeft = SimpleAnimation(AnimationEnum.Look_down_left.name);
    controllerLookIdle = SimpleAnimation(AnimationEnum.look_idle.name);
  }
}
