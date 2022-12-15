import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_animation/animation_controllers.dart';
import 'package:login_animation/animation_enum.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "donia@gmail.com";
  String password = "12345678";
  final passwordFocusNode = FocusNode();

  void checkFocusPasswordAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        AnimationControllers.addHandsUpController();
      } else if (!passwordFocusNode.hasFocus) {
        AnimationControllers.addHandsDownController();
      }
    });
  }

  void checkEmailandPassword() {
    Future.delayed(const Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        AnimationControllers.addSuccessController();
      } else {
        AnimationControllers.addFailController();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    AnimationControllers.generateControllers();

    // rootBundle: it loads the assets along the project so, you can access it
    rootBundle.load('assets/animated_login.riv').then((data) {
      final file = RiveFile.import(data); // carries animation file
      final artboard = file.mainArtboard; // carries states of animation file
      // add the default controller for the first time = default animation tezhar awel ma el app y3mel run
      artboard.addController(AnimationControllers.controllerIdle);
      setState(() {
        AnimationControllers.riveArtboard = artboard;
      });
    });
    checkFocusPasswordAnimationState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: AnimationControllers.riveArtboard == null
                    ? const SizedBox.shrink()
                    : Rive(artboard: AnimationControllers.riveArtboard!),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      // height: MediaQuery.of(context).size.height / 15,
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: const Text("Email"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0))),
                        validator: (value) =>
                            value != email ? "wrong email" : null,
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              value.length < 12 &&
                              !AnimationControllers.isLookLeft) {
                            AnimationControllers.addLookDownLeftController();
                          } else if (value.isNotEmpty &&
                              value.length > 12 &&
                              !AnimationControllers.isLookRight) {
                            AnimationControllers.addLookDownRightController();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 24,
                    ),
                    SizedBox(
                      // height: MediaQuery.of(context).size.height / 15,
                      child: TextFormField(
                        obscureText: true,
                        focusNode: passwordFocusNode,
                        decoration: InputDecoration(
                            label: const Text("Password"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0))),
                        validator: (value) =>
                            value != password ? "wrong password" : null,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 16,
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 18,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 8),
                      child: TextButton(
                        onPressed: () {
                          passwordFocusNode.unfocus();
                          checkEmailandPassword();
                        },
                        style: TextButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 0)),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
