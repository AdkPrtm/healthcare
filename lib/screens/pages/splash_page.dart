part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initTimer();
  }

  void initTimer() async {
    if (await checkInternet()) {
      Timer(
        Duration(seconds: 4),
        () {
          User? user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            Navigator.pushReplacementNamed(context, '/intro');
          } else {
            context.read<UserBloc>().add(LoadUser(user.uid));
            Navigator.pushReplacementNamed(context, '/main');
          }
        },
      );
    }
  }

  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: FutureBuilder<Object>(
        future: checkInternet(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/splash.json',
                repeat: true,
                frameRate: FrameRate.max,
              ),
            );
          } else if (snapshot.data == true) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/splash.json',
                repeat: true,
                frameRate: FrameRate.max,
              ),
            );
          } else {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    initTimer();
                  });
                },
                child: NoConnectionPage());
          }
        },
      ),
    );
  }
}
