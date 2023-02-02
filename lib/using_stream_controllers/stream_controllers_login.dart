import 'dart:async';
import 'dart:developer';
import 'package:login_animation/animation_controllers.dart';

class BearStreamControllers
    implements InputStreamController, OutputStreamController {
  final StreamController inputEmailStreamController =
      StreamController<String>.broadcast();
  final StreamController inputPasswordStreamController =
      StreamController<String>.broadcast();
  final StreamController inputValidStreamController =
      StreamController<bool>.broadcast();

  String email = "donia@gmail.com";
  String password = "12345678";

  @override
  Sink get inputEmail => inputEmailStreamController.sink;

  @override
  Sink get inputPassword => inputPasswordStreamController.sink;

  @override
  setEmail(String email) {
    // AnimationControllers.addHandsDownController();
    inputEmail.add(email);
    if (email.length < 10) {
      AnimationControllers.addLookDownRightController();
    } else if (email.length > 10) {
      AnimationControllers.addLookDownLeftController();
    }
    log("setEmail: ");
  }

  @override
  setPassword(String password) {
    log("setPassword: ");
    inputPassword.add(password);
  }

  bool checkEmail(String email) {
    log("Email");
    return email == "donia@gmail.com";
  }

  bool checkPassword(String password) {
    log("Password");
    return password == "12345678";
  }

  @override
  login(String email, String password) {
    log("login");
    checkEmail(email) && checkPassword(password)
        ? AnimationControllers.addSuccessController()
        : AnimationControllers.addFailController();
  }

  @override
  Stream<bool> get outputEmail =>
      inputEmailStreamController.stream.map((email) => checkEmail(email));

  @override
  Stream<bool> get outputPassword => inputPasswordStreamController.stream
      .map((password) => checkPassword(password));
}

abstract class InputStreamController {
  Sink get inputEmail;
  Sink get inputPassword;

  setEmail(String email);
  setPassword(String password);
  login(String email, String password);
}

abstract class OutputStreamController {
  Stream<bool> get outputEmail;
  Stream<bool> get outputPassword;
}
