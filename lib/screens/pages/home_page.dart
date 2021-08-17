part of 'pages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? uid;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            this.uid = state.userModel.id;
            return Row(
              children: [
                Expanded(
                  child: Text(
                    '👋🏻 Hi ${state.userModel.name}!',
                    style: textStyle.copyWith(
                      fontSize: 24,
                      fontWeight: bold,
                      color: kPrimaryColor1,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: kPrimaryColor6),
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: state.userModel.imageUrl == ''
                              ? AssetImage('assets/images/avatar.png')
                              : NetworkImage(state.userModel.imageUrl)
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
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
                CardHomeWidget(
                  title: 'Your Diet Chart',
                  imageUrl: 'assets/images/Illustration.png',
                  onTap: () {},
                ),
                CardHomeWidget(
                  title: 'Medical History',
                  imageUrl: 'assets/images/Illustration2.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => AffirmationPage(uid: uid!),
                      ),
                    );
                  },
                ),
                CardHomeWidget(
                  title: 'Lab Results',
                  imageUrl: 'assets/images/Illustration3.png',
                  onTap: () {},
                ),
                CardHomeWidget(
                  title: 'Online Chat',
                  imageUrl: 'assets/images/Illustration4.png',
                  onTap: () {},
                ),
                CardHomeWidget(
                  title: 'Finding yourself',
                  imageUrl: 'assets/images/Illustration5.png',
                  marginBottom: 56,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
