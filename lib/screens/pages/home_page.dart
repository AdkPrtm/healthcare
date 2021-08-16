part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Row(
        children: [
          Expanded(
            child: Text(
              '👋🏻 Hi Julia!',
              style: textStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
                color: kPrimaryColor1,
              ),
            ),
          ),
          Container(
            height: 46,
            width: 46,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor6),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/avatar.png'),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: Column(
              children: [
                header(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/affirmation');
                  },
                  child: CardHomeWidget(
                    title: 'Your Diet Chart',
                    imageUrl: 'assets/images/Illustration.png',
                  ),
                ),
                CardHomeWidget(
                  title: 'Medical History',
                  imageUrl: 'assets/images/Illustration2.png',
                ),
                CardHomeWidget(
                  title: 'Lab Results',
                  imageUrl: 'assets/images/Illustration3.png',
                ),
                CardHomeWidget(
                  title: 'Online Chat',
                  imageUrl: 'assets/images/Illustration4.png',
                ),
                CardHomeWidget(
                  title: 'Finding yourself',
                  imageUrl: 'assets/images/Illustration5.png',
                  marginBottom: 56,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
