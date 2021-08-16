part of 'widgets.dart';

class CardNotificationWidget extends StatelessWidget {
  const CardNotificationWidget({
    Key? key, this.marginBottom = 0,
  }) : super(key: key);

  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: marginBottom),
      padding: EdgeInsets.all(16),
      height: 105,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: kPrimaryColor6,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor1,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notification Title',
                  style: textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                    color: kPrimaryColor1,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, ipsum dolor',
                  style: textStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
