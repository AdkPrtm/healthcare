part of 'widgets.dart';

class ListEditWidget extends StatelessWidget {
  const ListEditWidget({
    Key? key,
    required this.svgAsset,
    required this.title,
  }) : super(key: key);

  final String svgAsset, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          SvgPicture.asset(svgAsset, width: 14),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: textStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
                color: kPrimaryColor2,
              ),
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: kPrimaryColor4),
        ],
      ),
    );
  }
}
