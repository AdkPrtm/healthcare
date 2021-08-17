part of 'pages.dart';

class AddMedicalPage extends StatefulWidget {
  const AddMedicalPage({Key? key}) : super(key: key);

  @override
  _AddMedicalPageState createState() => _AddMedicalPageState();
}

class _AddMedicalPageState extends State<AddMedicalPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  DateTime? checkDate;
  DateTime? inputDate;
  @override
  Widget build(BuildContext context) {
    Widget content(String uid) {
      return Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Medical History',
              style: textStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
                color: kPrimaryColor1,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Description Medical',
              style: textStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: kPrimaryColor1,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              key: _formKey,
              controller: descriptionController,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              style: textStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
                color: kPrimaryColor1,
              ),
              cursorColor: kPrimaryColor1,
              decoration: InputDecoration(
                hintText: 'Description History',
                hintStyle: textStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                  color: kPrimaryColor3,
                ),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  return "Please enter history medical";
                }
              },
            ),
            SizedBox(height: 10),
            Text(
              'Date Medical',
              style: textStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: kPrimaryColor1,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 40,
              child: TextButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 1, 12),
                    lastDate: DateTime.now(),
                    // locale: Locale('id'),
                  ).then((pickedDate) {
                    // Check if no date is selected
                    if (pickedDate != null) {
                      setState(() {
                        checkDate = pickedDate;
                      });
                      return;
                    }
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: kPrimaryColor1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  checkDate == null
                      ? 'Pick Date Please'
                      : DateFormat('dd-MM-yyyy').format(checkDate!),
                  style: textStyle.copyWith(color: kBackgroundColor),
                ),
              ),
            ),
            Spacer(),
            BlocConsumer<MedicalhistoryBloc, MedicalhistoryState>(
              listener: (context, state) {
                if (state is MedicalhistorySuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                } else if (state is MedicalhistoryFailed) {
                  var msg = state.msg ?? '';
                  CustomWidgets.buildErrorSnackbar(context, msg);
                }
              },
              builder: (context, state) {
                if (state is UserLoading) {
                  return Container(
                    height: 42,
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
                  width: double.infinity,
                  height: 42,
                  child: TextButton(
                    onPressed: () {
                      context.read<MedicalhistoryBloc>().add(AddMedicalHistory(
                            uid: uid,
                            description: descriptionController.text,
                            checkDate: checkDate!,
                            inputDate: DateTime.now(),
                          ));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: textStyle.copyWith(color: kBackgroundColor),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
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
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return content(state.userModel.id);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}