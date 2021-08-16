part of 'pages.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png',
              height: 233,
              width: 331,
            ),
            SizedBox(height: 6),
            Text(
              'Opps! No Internet Connection',
              style: textStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
                color: kPrimaryColor1,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Tap the screen to try again',
              style: textStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
                color: kPrimaryColor4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
