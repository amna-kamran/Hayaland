part of '../../home_screen.dart';

class _ExpandedContainer extends StatelessWidget {
  final String text;
  final String path;
  final double height;
  final double width;
  final int borderColor;
  final double fontSize;
  final MainAxisAlignment mainAxisAlignment;

  const _ExpandedContainer({
    required this.text,
    required this.path,
    required this.height,
    required this.width,
    required this.borderColor,
    required this.fontSize,
    required this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return customContainer(context);
  }

  Container customContainer(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.2,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02),
      decoration: BoxDecoration(
        border: Border.all(color: Color(borderColor)),
        borderRadius: BorderRadius.circular(3),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 3.0,
        horizontal: 3.0,
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            path,
            width: width,
            height: height,
            color: Colors.black,
          ),
          const SizedBox(width: Space.x),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
