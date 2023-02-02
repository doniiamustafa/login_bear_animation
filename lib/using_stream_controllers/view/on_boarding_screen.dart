import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:login_animation/login_screen.dart';
import 'package:login_animation/using_stream_controllers/view/login_view_stream_controllers.dart';
import 'package:login_animation/using_stream_controllers/view/register_view.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OnBoardingSlider(
          controllerColor: Colors.grey[500],
          headerBackgroundColor: Colors.white,
          finishButtonText: 'الدخول',
          onFinish: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
          },
          skipTextButton: const Text("تخطي"),

          skipFunctionOverride: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
          },
          // trailing: Text('Skip'),
          background: [
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 1,
                child: Image.asset('assets/boarding.jpg')),
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 1,
                child: Image.asset('assets/boarding2.png')),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 1,
              child: Image.asset(
                'assets/boarding3.png',
              ),
            ),
          ],
          totalPage: 3,
          speed: 1.8,
          pageBodies: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.54,
                  ),
                  const Text(
                    'خدماتنا الطبيه',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.06,
                  ),
                  const Text(
                    ' تستطيع القيام بالاستشاره من داخل التطبيق الخاص بنا من مكانك',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.54,
                  ),
                  const Text(
                    'الكشف عن المرض',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.06,
                  ),
                  const Text(
                    'تستطيع الكشف عن المرض عن طريق الأستعلام عن الأعراض',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.54,
                  ),
                  const Text(
                    'الثقه و الجوده',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.06,
                  ),
                  const Text(
                    'كل البيانات تكون مراجعه عن طريق أفضل الأطباء',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
