import 'package:flutter/material.dart';
import 'package:login_animation/using_stream_controllers/view/login_view_stream_controllers.dart';
import 'package:login_animation/using_stream_controllers/on_boarding_model.dart';
import 'package:onboarding_screen/onboarding_screen.dart';

class OnboardingView extends StatelessWidget {
  final PageController _controller = PageController();
  List<OnBoardingModel> mySlides = [
    OnBoardingModel(
      imageAssetPath: Image.asset(
        'assets/boarding.jpg',
        // scale: 5,
      ),
      title: 'خدماتنا الطبيه',
      desc: 'تستطيع القيام بالاستشاره من داخل التطبيق الخاص بنا من مكانك',
      // minTitleFontSize: 20,
      descStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      // miniDescFontSize: 14,
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    OnBoardingModel(
      imageAssetPath: Image.asset('assets/boarding2.png'),
      title: 'الكشف عن المرض',
      desc: 'تستطيع الكشف عن المرض عن طريق الأستعلام عن الأعراض',
      // minTitleFontSize: 20,
      descStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      // miniDescFontSize: 14,
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    OnBoardingModel(
      imageAssetPath: Image.asset('assets/boarding3.png'),
      title: 'الثقه و الجوده',
      desc: 'كل البيانات تكون مراجعه عن طريق أفضل الأطباء',
      // minTitleFontSize: 20,
      descStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      // miniDescFontSize: 14,
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OnBoardingScreen(
        label: const Text(
          "اضغط هنا",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        function: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreenNew()));
        },
        mySlides: mySlides,
        controller: _controller,
        slideIndex: 0,
        indicators: Indicators.cool,
        // statusBarColor: Colors.red,
        // startGradientColor: Colors.red,
        // endGradientColor: Colors.blue,
        skipStyle: const TextStyle(color: Colors.white),
        // pageIndicatorColorList: const [
        //   Colors.white,
        //   Colors.green,
        //   Colors.red,
        //   Colors.yellow,
        //   Colors.white
        // ],
      ),
    );
  }
}

