part of 'widgets.dart';

class CardAffirmationWidget extends StatelessWidget {
  CardAffirmationWidget({
    Key? key,
    required this.description,
    required this.checkDate,
  }) : super(key: key);

  final String description;
  final DateTime checkDate;

  @override
  Widget build(BuildContext context) {
    final String _now = DateFormat.yMMMMd().format(checkDate);
    return GestureDetector(
      onTap: () {
        dataDiaolog(context, _now);
      },
      child: Container(
        width: double.infinity,
        height: 103,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _now,
              style: textStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
                color: kPrimaryColor1,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Text(
                description,
                style: textStyle.copyWith(
                  fontWeight: medium,
                  color: kPrimaryColor3,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> dataDiaolog(BuildContext context, String _now) {
    return showDialog(
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
                  _now,
                  style: textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                    color: kPrimaryColor1,
                  ),
                ),
                Divider(),
                Text(
                  description,
                  style: textStyle.copyWith(
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
