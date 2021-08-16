part of 'pages.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: textStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                  color: kPrimaryColor1,
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 112,
                          width: 112,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: kPrimaryColor6),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/avatar.png'),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 36,
                            width: 36,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(svgEdit),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Julia Mario',
                      style: textStyle.copyWith(
                        fontSize: 24,
                        fontWeight: bold,
                        color: kPrimaryColor1,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'juliamario@mail.com',
                      style: textStyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                        color: kPrimaryColor3,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              ListEditWidget(title: 'Account', svgAsset: svgPerson),
              ListEditWidget(title: 'Notificantion', svgAsset: svgNotification),
              ListEditWidget(title: 'Appearance', svgAsset: svgEye),
              ListEditWidget(
                  title: 'Privacy & Security', svgAsset: svgSecurity),
              ListEditWidget(title: 'Sound', svgAsset: svgVolume),
              ListEditWidget(title: 'Language', svgAsset: svgLanguage),
            ],
          ),
        ),
      ),
    );
  }
}
