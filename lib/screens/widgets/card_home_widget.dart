part of 'widgets.dart';

class CardHomeWidget extends StatelessWidget {
  const CardHomeWidget({
    Key? key,
    required this.title,
    required this.imageUrl, this.marginBottom =0,
  }) : super(key: key);

  final String title, imageUrl;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: marginBottom),
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 116,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kPrimaryColor6,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: textStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
              color: kPrimaryColor1,
            ),
          ),
          Expanded(child: Image.asset(imageUrl)),
        ],
      ),
    );
  }
}
