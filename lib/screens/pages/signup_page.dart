part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Text(
            'Hello Beautiful',
            style: textStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
              color: kPrimaryColor1,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Sign Up',
            style: textStyle.copyWith(
              fontSize: 32,
              fontWeight: bold,
              color: kPrimaryColor1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, bottom: 24),
            height: 280,
            width: 327,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
              ),
            ),
          ),
        ],
      );
    }

    Widget signUpButton() {
      return BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            successfullyDialog(context);
          } else if (state is UserFailed) {
            var msg = state.msg ?? '';
            CustomWidgets.buildErrorSnackbar(context, msg);
          }
        },
        builder: (context, state) {
          if (state is UserLoading) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              height: 42,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor1,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Container(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: kBackgroundColor,
                  ),
                ),
              ),
            );
          }
          return Container(
            margin: EdgeInsets.symmetric(vertical: 24),
            height: 42,
            width: double.infinity,
            child: TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  context.read<UserBloc>().add(
                        SignUpUser(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                }
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
          );
        },
      );
    }

    Widget fieldInput() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFieldWidget(controller: nameController, hint: "Full Name"),
              CustomFieldWidget(controller: emailController, hint: "Email"),
              CustomFieldWidget(
                controller: passwordController,
                hint: "Password",
              ),
              CustomFieldWidget(
                controller: confirmPasswordController,
                controller2: passwordController,
                hint: "Confirm Password",
                margin: 8,
              ),
              signUpButton(),
            ],
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 54),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: textStyle.copyWith(
                fontWeight: medium,
                color: Color(0xFF82799D),
              ),
            ),
            SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Login',
                style: textStyle.copyWith(
                  fontWeight: medium,
                  color: kPrimaryColor1,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            fieldInput(),
            footer(),
          ],
        ),
      ),
    );
  }

  Future<dynamic> successfullyDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'REGISTRATION SUCCESS',
                style: poppinsStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                  color: kPrimaryColor1,
                ),
              ),
              Divider(),
              Text(
                'Thank you. We have sent you email to ${emailController.text}. \nPlease click the link in that message to activate your account.',
                style: poppinsStyle.copyWith(
                  fontWeight: medium,
                  color: kPrimaryColor1,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                fixedSize: Size(100, 40),
                backgroundColor: kPrimaryColor1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Close',
                style: textStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                  color: kBackgroundColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
