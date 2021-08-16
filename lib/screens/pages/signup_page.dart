part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Widget header() {
      return Column(
        children: [
          SizedBox(height: 34),
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

    Widget loginButton() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 24),
        height: 42,
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              print('berhasil');
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
                margin: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: textStyle.copyWith(
                    fontWeight: medium,
                    color: kPrimaryColor1,
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
              'Already have an account?',
              style: textStyle.copyWith(
                fontWeight: medium,
                color: Color(0xFF82799D),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
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
}
