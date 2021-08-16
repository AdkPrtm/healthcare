part of 'pages.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int currentIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          HomePage(),
          NotificationPage(),
          SettingPage(),
        ],
      );
    }

    Widget customButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 56,
          child: BottomNavigationBar(
            elevation: 10,
            backgroundColor: kBackgroundColor,
            currentIndex: currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (value) {
              setState(() {
                currentIndex = value;
                pageController.jumpToPage(value);
              });
            },
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset(
                  svgHome,
                  color: currentIndex == 0 ? kPrimaryColor1 : kPrimaryColor4,
                ),
              ),
              BottomNavigationBarItem(
                  label: '',
                  icon: SvgPicture.asset(
                    svgNotification,
                    color: currentIndex == 1 ? kPrimaryColor1 : kPrimaryColor4,
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: SvgPicture.asset(
                    svgSetting,
                    color: currentIndex == 2 ? kPrimaryColor1 : kPrimaryColor4,
                  ))
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          buildContent(),
          customButtonNavigation(),
        ],
      ),
    );
  }
}
