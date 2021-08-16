part of 'pages.dart';

class IntroductionPage extends StatefulWidget {
  IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  PageController _controller = PageController(initialPage: 0, keepPage: false);
  int currentIndex = 0;

  final List<Map<String, dynamic>> introData = [
    {
      'imageUrl': 'assets/images/hand.png',
      'title': 'Discover Top Doctors',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat'
    },
    {
      'imageUrl': 'assets/images/caretaking.png',
      'title': 'Ask a Doctor Online',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat'
    },
    {
      'imageUrl': 'assets/images/patient.png',
      'title': 'Get Expert Advice',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: introData.length,
              itemBuilder: (context, index) => IntroductionWidget(
                imageUrl: introData[index]['imageUrl'],
                title: introData[index]['title'],
                description: introData[index]['description'],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              introData.length,
              (index) => dotsContainer(index: index),
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: 42,
            width: 200,
            child: TextButton(
              onPressed: currentIndex == introData.length - 1
                  ? () {
                      Navigator.pushReplacementNamed(context, '/menu');
                    }
                  : () {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
              style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text(
                currentIndex == introData.length - 1
                    ? 'Let\'s Started'
                    : 'Next',
                style: textStyle.copyWith(
                  color: kBackgroundColor,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  AnimatedContainer dotsContainer({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? kPrimaryColor1 : Color(0xFFE0DDEA),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String imageUrl, title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 343,
            height: 350,
          ),
          Text(
            title,
            style: textStyle.copyWith(
              fontSize: 30,
              fontWeight: bold,
              color: kPrimaryColor1,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: textStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
              color: Color(0xFF82799D),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
