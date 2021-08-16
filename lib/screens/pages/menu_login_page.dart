part of 'pages.dart';

class MenuLoginPage extends StatelessWidget {
  const MenuLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'Welcome to',
              style: textStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
                color: kPrimaryColor1,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Self Care',
              style: textStyle.copyWith(
                fontSize: 32,
                fontWeight: bold,
                color: kPrimaryColor1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 46),
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16, left: 24, right: 24),
              height: 42,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: Text(
                  'Sign Up',
                  style: textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    color: kBackgroundColor,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: 42,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: TextButton.styleFrom(
                    backgroundColor: kBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      color: kPrimaryColor1,
                    )),
                child: Text(
                  'Login',
                  style: textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    color: kPrimaryColor1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
