part of 'pages.dart';

class AffirmationPage extends StatefulWidget {
  const AffirmationPage({Key? key}) : super(key: key);

  @override
  _AffirmationPageState createState() => _AffirmationPageState();
}

class _AffirmationPageState extends State<AffirmationPage> {
  @override
  void initState() {
    context.read<MedicalhistoryBloc>().add(FetchMedicalHistory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget content(List<MedicalHistoryModel> state) {
      return ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            height: 116,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor6,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  'Medical History',
                  style: textStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                    color: kPrimaryColor1,
                  ),
                ),
                Expanded(child: Image.asset('assets/images/Illustration.png')),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: size.height,
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: kPrimaryColor6,
            ),
            child: Column(
              children: state
                  .map((MedicalHistoryModel medicalHistoryModel) =>
                      CardAffirmationWidget(
                        description: medicalHistoryModel.description,
                        checkDate: medicalHistoryModel.checkDate,
                      ))
                  .toList(),
            ),
          ),
        ],
      );
    }

    Widget isEmpty() {
      return Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Medical History',
                  style: textStyle.copyWith(
                    fontSize: 24,
                    fontWeight: bold,
                    color: kPrimaryColor1,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset('assets/images/Illustration6.png'),
                        SizedBox(height: 6),
                        Text(
                          'You don’t have any records.',
                          style: textStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                            color: kPrimaryColor1,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Click the plus button to add',
                          style: textStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                            color: kPrimaryColor4,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 3,
              right: 15,
              child: SvgPicture.asset(
                svgLines,
                width: 30,
              ),
            ),
            Positioned(
              bottom: 50,
              right: 70,
              child: SvgPicture.asset(
                svgArrow,
                width: 80,
              ),
            ),
          ],
        ),
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
      body: BlocConsumer<MedicalhistoryBloc, MedicalhistoryState>(
        listener: (context, state) {
          if (state is MedicalhistoryFailed) {
            var msg = state.msg ?? 'Failed Fetch Data';
            CustomWidgets.buildErrorSnackbar(context, msg);
          }
        },
        builder: (context, state) {
          if (state is MedicalhistoryLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MedicalhistorySuccess) {
            return content(state.medicalHistoryModel);
          } else {
            return isEmpty();
          }
        },
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(highlightColor: kSecondaryColor),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addmedical');
          },
          backgroundColor: kSecondaryColor,
          hoverColor: kSecondaryColor,
          focusColor: kSecondaryColor,
          child: Icon(
            Icons.add,
            color: kPrimaryColor1,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
