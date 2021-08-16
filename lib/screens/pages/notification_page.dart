part of 'pages.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Text(
        'Notifications',
        style: textStyle.copyWith(
          fontSize: 24,
          fontWeight: bold,
          color: kPrimaryColor1,
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                CardNotificationWidget(),
                CardNotificationWidget(),
                CardNotificationWidget(),
                CardNotificationWidget(),
                CardNotificationWidget(
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
