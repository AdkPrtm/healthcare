part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  XFile? image;
  String? uid;

  Future pickImageSet() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() => this.image = image);
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Text(
        'Edit Profile',
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
      return Form(
        key: _formKey,
        child: TextFormField(
          controller: nameController,
          cursorColor: kPrimaryColor3,
          style: textStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
            color: kPrimaryColor1,
          ),
          decoration: InputDecoration(
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
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: kPrimaryColor1,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your name";
            }
          },
        ),
      );
    }

    Widget circleImage(UserSuccess state) {
      return Center(
        child: GestureDetector(
          onTap: image != null
              ? () => setState(() => this.image = null)
              : () => pickImageSet(),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 112,
                width: 112,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: kPrimaryColor6),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: image != null
                          ? FileImage(File(image!.path))
                          : state.userModel.imageUrl == ''
                              ? AssetImage('assets/images/avatar.png')
                              : NetworkImage(state.userModel.imageUrl)
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
                  child: image != null
                      ? Icon(
                          Icons.delete,
                          color: kPrimaryColor4,
                        )
                      : SvgPicture.asset(svgEdit),
                ),
              ),
            ],
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

    Widget updateButton() {
      return BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is UserLoading) {
            return Container(
              height: 42,
              margin: EdgeInsets.symmetric(vertical: 24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor1,
                borderRadius: BorderRadius.circular(12),
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
                  context.read<UserBloc>().add(UpdateDataUser(uid!,
                      nameController.text, image == null ? '' : image!.path));
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
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            dataContent(),
            updateButton(),
          ],
        ),
      ),
    );
  }
}
