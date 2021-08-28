part of 'pages.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? uid;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Text(
        'Change Password',
        style: textStyle.copyWith(
          fontSize: 24,
          fontWeight: bold,
          color: kPrimaryColor1,
        ),
      );
    }

    Widget fieldEmail(UserSuccess state) {
      return TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          fillColor: kPrimaryColor6,
          hintText: state.userModel.email,
          hintStyle: textStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
            color: kPrimaryColor1,
          ),
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: kPrimaryColor6,
            ),
          ),
        ),
      );
    }

    Widget fieldName(UserSuccess state) {
      return TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          fillColor: kPrimaryColor6,
          hintText: state.userModel.name,
          hintStyle: textStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
            color: kPrimaryColor1,
          ),
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: kPrimaryColor6,
            ),
          ),
        ),
      );
    }

    Widget fieldPassword(UserSuccess state) {
      return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFieldWidget(
                controller: oldpasswordController,
                hint: "Password",
                margin: 10,
              ),
              Text(
                'New Password',
                style: textStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                  color: kPrimaryColor1,
                ),
              ),
              SizedBox(height: 10),
              CustomFieldWidget(
                controller: passwordController,
                hint: "Password",
                margin: 10,
              ),
              Text(
                'New Confirm Password',
                style: textStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                  color: kPrimaryColor1,
                ),
              ),
              SizedBox(height: 10),
              CustomFieldWidget(
                controller: confirmPasswordController,
                controller2: passwordController,
                hint: "Confirm Password",
                margin: 8,
              ),
            ],
          ));
    }

    Widget circleImage(UserSuccess state) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 112,
          width: 112,
          padding: EdgeInsets.all(10),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor6),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: state.userModel.imageUrl == ''
                    ? AssetImage('assets/images/avatar.png')
                    : NetworkImage(state.userModel.imageUrl) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    }

    Widget updateButton(String email) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 24),
        height: 42,
        width: double.infinity,
        child: TextButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              if (await AuthService().changePassword(
                email: email,
                password: passwordController.text,
                oldpassword: oldpasswordController.text,
              )) {
                Navigator.pop(context);
              } else {
                CustomWidgets.buildErrorSnackbar(
                    context, 'Incorrect Old Password.');
              }
            }
          },
          style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            'Update',
            style: textStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: kBackgroundColor,
            ),
          ),
        ),
      );
    }

    Widget dataContent() {
      return BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            this.uid = state.userModel.id;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                circleImage(state),
                SizedBox(height: 10),
                Text(
                  'Email Address',
                  style: textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    color: kPrimaryColor1,
                  ),
                ),
                SizedBox(height: 10),
                fieldEmail(state),
                SizedBox(height: 10),
                Text(
                  'Full Name',
                  style: textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    color: kPrimaryColor1,
                  ),
                ),
                SizedBox(height: 10),
                fieldName(state),
                SizedBox(height: 10),
                Text(
                  'Password',
                  style: textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    color: kPrimaryColor1,
                  ),
                ),
                SizedBox(height: 10),
                fieldPassword(state),
                updateButton(state.userModel.email),
              ],
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: kPrimaryColor1,
        ),
      ),
      // body: content(),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              dataContent(),
            ],
          ),
        ),
      ),
    );
  }
}
