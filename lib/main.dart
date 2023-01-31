import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:login_animation/login_screen.dart';
import 'package:login_animation/using_stream_controllers/login_screen_new.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onboarding_screen/onboarding_screen.dart';

import 'using_stream_controllers/on_boarding_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // final FlutterLocalization localization = FlutterLocalization.instance;
  // void initState() {
  //   localization.init(
  //     mapLocales: [
  //       // const MapLocale('en', AppLocale.EN),
  //       // const MapLocale('km', AppLocale.KM),
  //       // const MapLocale('ja', AppLocale.JA),
  //     ],
  //     initLanguageCode: 'ar',
  //   );
  //   localization.onTranslatedLanguage = _onTranslatedLanguage;
  //   super.initState();
  // }

  // /// the setState function here is a must to add
  // void _onTranslatedLanguage(Locale? locale) {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
      ],
      home: OnboardingView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
