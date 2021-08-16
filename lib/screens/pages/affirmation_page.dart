part of 'pages.dart';

class AffirmationPage extends StatelessWidget {
  const AffirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget content() {
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
              children: [
                CardAffirmationWidget(),
                CardAffirmationWidget(),
                CardAffirmationWidget(),
                CardAffirmationWidget(),
                CardAffirmationWidget(),
                CardAffirmationWidget(),
                CardAffirmationWidget(),
                CardAffirmationWidget(),
              ],
            ),
            // child: GridView(
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     mainAxisSpacing: 10,
            //     crossAxisSpacing: 11,
            //     childAspectRatio: 2 / 3,
            //   ),
            // children: [
            //   Container(
            //     height: 176,
            //     width: 166,
            //     decoration: BoxDecoration(
            //       color: kBackgroundColor,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Text('YYYyy'),
            //   )
            // ],
            // ),
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
      body: isEmpty(),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(highlightColor: kSecondaryColor),
        child: FloatingActionButton(
          onPressed: () {},
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
