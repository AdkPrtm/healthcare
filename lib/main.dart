import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare/bloc/medicalhistory_bloc.dart';
import 'package:healthcare/bloc/user_bloc.dart';
import 'package:healthcare/screens/pages/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => MedicalhistoryBloc()),
      ],
      child: MaterialApp(
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
          '/addmedical': (context) => AddMedicalPage(),
          '/editprofile': (context) => EditProfilePage(),
        },
      ),
    );
  }
}
