import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_animation/animation_controllers.dart';
import 'package:login_animation/using_stream_controllers/stream_controllers.dart';
import 'package:rive/rive.dart';

class LoginScreenNew extends StatefulWidget {
  const LoginScreenNew({super.key});

  @override
  State<LoginScreenNew> createState() => _LoginScreenNewState();
}

class _LoginScreenNewState extends State<LoginScreenNew> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final passwordFocusNode = FocusNode();
  final BearStreamControllers _bearStreamControllers = BearStreamControllers();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkFocusPasswordAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        AnimationControllers.addHandsUpController();
      } else if (!passwordFocusNode.hasFocus) {
        AnimationControllers.addHandsDownController();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(
        () => _bearStreamControllers.setEmail(emailController.text));
    passwordController.addListener(
        () => _bearStreamControllers.setPassword(passwordController.text));

    AnimationControllers.generateControllers();
    rootBundle.load('assets/animated_login.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
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
                      child: StreamBuilder(
                          stream: _bearStreamControllers.outputEmail,
                          builder: (context, snapshot) => TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    errorText: snapshot.data == true ||
                                            snapshot.data == null
                                        ? null
                                        : "wrong email",
                                    label: const Text("Email"),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0))),
                              )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 24,
                    ),
                    SizedBox(
                      // height: MediaQuery.of(context).size.height / 15,
                      child: StreamBuilder(
                        stream: _bearStreamControllers.outputPassword,
                        builder: (context, snapshot) => TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          focusNode: passwordFocusNode,
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.data == true || snapshot.data == null
                                      ? null
                                      : "wrong password",
                              label: const Text("Password"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0))),
                        ),
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
                          _bearStreamControllers.login(emailController.text, passwordController.text);
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