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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Settings',
                    style: textStyle.copyWith(
                      fontSize: 24,
                      fontWeight: bold,
                      color: kPrimaryColor1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<UserBloc>().add(SignOutUser());
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/menu', (route) => false);
                    },
                    child: SvgPicture.asset(
                      svgLogout,
                      color: kPrimaryColor2,
                      width: 20,
                      height: 20,
                    ),
                  )
                ],
              ),
              SizedBox(height: 24),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserSuccess) {
                    return Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/editprofile'),
                            child: Stack(
                              children: [
                                Container(
                                  height: 112,
                                  width: 112,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kPrimaryColor6),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: state.userModel.imageUrl == ''
                                            ? AssetImage(
                                                'assets/images/avatar.png')
                                            : NetworkImage(
                                                    state.userModel.imageUrl)
                                                as ImageProvider,
                                        fit: BoxFit.cover,
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
                          ),
                          SizedBox(height: 12),
                          Text(
                            state.userModel.name,
                            style: textStyle.copyWith(
                              fontSize: 24,
                              fontWeight: bold,
                              color: kPrimaryColor1,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12),
                          Text(
                            state.userModel.email,
                            style: textStyle.copyWith(
                              fontSize: 12,
                              fontWeight: medium,
                              color: kPrimaryColor3,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              SizedBox(height: 32),
              GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/editprofile'),
                  child: ListEditWidget(title: 'Account', svgAsset: svgPerson)),
              Divider(),
              GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/changepassword'),
                  child: ListEditWidget(
                      title: 'Change Password', svgAsset: svgSecurity)),
              Divider(),
              ListEditWidget(title: 'Notificantion', svgAsset: svgNotification),
              Divider(),
              ListEditWidget(title: 'Appearance', svgAsset: svgEye),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
