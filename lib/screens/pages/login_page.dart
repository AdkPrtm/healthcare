part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Text(
            'Welcome to',
            style: textStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
              color: kPrimaryColor1,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Login',
            style: textStyle.copyWith(
              fontSize: 32,
              fontWeight: bold,
              color: kPrimaryColor1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 28, bottom: 24),
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

    Widget loginButton() {
      return BlocConsumer<UserBloc, UserState>(
        listener: (context, state) async {
          if (state is UserSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
          } else if (state is UserFailed) {
            var msg = state.msg ?? '';
            if (msg != 'Please verify your email address first') {
              CustomWidgets.buildErrorSnackbar(context, msg);
            } else {
              await warningDialog(context);
            }
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<UserBloc>().add(
                        SignInUser(
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
                'Login',
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
              CustomFieldWidget(
                controller: emailController,
                hint: 'Email',
              ),
              CustomFieldWidget(
                controller: passwordController,
                hint: 'Password',
                margin: 8,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (builder) {
                      return AlertDialog(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Forgot Password',
                              style: poppinsStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                                color: kPrimaryColor1,
                              ),
                            ),
                            Divider(),
                            Text(
                              'Your Email Address',
                              style: poppinsStyle.copyWith(
                                fontWeight: medium,
                                color: kPrimaryColor1,
                              ),
                            ),
                            SizedBox(height: 8),
                            CustomFieldWidget(
                              controller: emailController,
                              hint: 'Email',
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              if (emailController.text != '' &&
                                  RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                      .hasMatch(emailController.text)) {
                                if (await AuthService().fogetPassword(
                                    email: emailController.text)) {
                                  Navigator.pop(context);
                                  CustomWidgets.buildErrorSnackbar(context,
                                      'Please check the verification main in your inbox.');
                                } else {
                                  Navigator.pop(context);
                                  CustomWidgets.buildErrorSnackbar(context,
                                      'No user exists with this email.');
                                }
                              } else {
                                Navigator.pop(context);
                                CustomWidgets.buildErrorSnackbar(
                                    context, 'Please enter your email address');
                              }
                            },
                            child: Text(
                              'Reset Password',
                              style: textStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                                color: kPrimaryColor1,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
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
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: textStyle.copyWith(
                      fontWeight: medium,
                      color: kPrimaryColor1,
                    ),
                  ),
                ),
              ),
              loginButton(),
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
              'Don’t have an account?',
              style: textStyle.copyWith(
                fontWeight: medium,
                color: Color(0xFF82799D),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                'Sign Up',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //from Welcome to Image
            header(),

            //from Email Field to Login Button
            fieldInput(),

            //text dont have an account
            footer(),
          ],
        ),
      ),
    );
  }

  warningDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login Failed',
                style: poppinsStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                  color: kPrimaryColor1,
                ),
              ),
              Divider(),
              Text(
                'Your account has not yet been verified. Please check the verification main in your inbox.',
                style: poppinsStyle.copyWith(
                  fontWeight: medium,
                  color: kPrimaryColor1,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await AuthService().resendEmail(
                    email: emailController.text,
                    password: passwordController.text);
                Navigator.pop(context);
              },
              child: Text(
                'Resend Email',
                style: textStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                  color: kPrimaryColor1,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
