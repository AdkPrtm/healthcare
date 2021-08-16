part of 'widgets.dart';

class CardAffirmationWidget extends StatelessWidget {
  const CardAffirmationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'Today',
            style: textStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
              color: kPrimaryColor1,
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur Lo...',
              style: textStyle.copyWith(
                fontWeight: medium,
                color: kPrimaryColor3,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
