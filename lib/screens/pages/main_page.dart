part of 'pages.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return NotificationPage();
        case 2:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customButtonNavigation(int currentIndex) {
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
              context.read<PageBloc>().add(PageTapped(buttomNavBar: value));
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

    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent((state as PageInitial).buttomNavBar),
              customButtonNavigation((state).buttomNavBar),
            ],
          ),
        );
      },
    );
  }
}
