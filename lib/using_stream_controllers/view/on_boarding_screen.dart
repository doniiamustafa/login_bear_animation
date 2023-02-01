import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700,
        width: double.infinity,
        child: OnBoardingSlider(
          middle: Center(),
          imageHorizontalOffset: -10,
          imageVerticalOffset: -100,
          headerBackgroundColor: Colors.white,
          finishButtonText: 'Register',
          skipTextButton: Text('Skip'),
          trailing: Text('Login'),
          background: [
            Image.asset('assets/boarding.jpg'),
            Image.asset('assets/boarding2.png'),
            Image.asset(
              'assets/boarding3.png',
            ),
          ],
          totalPage: 3,
          speed: 1.8,
          pageBodies: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: const <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Text('Description Text 1'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: const <Widget>[
                  SizedBox(
                    height: 480,
                  ),
                  Text('Description Text 2'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: const <Widget>[
                  SizedBox(
                    height: 480,
                  ),
                  Text('Description Text 3'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
