import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcare/screens/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Care',
      routes: {
        '/': (context) => SplashPage(),
        '/intro': (context) => IntroductionPage(),
        '/menu': (context) => MenuLoginPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/main': (context) => MainPage(),
        '/affirmation': (context) => AffirmationPage(),
      },
    );
  }
}
