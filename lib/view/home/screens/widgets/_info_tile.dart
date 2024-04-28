part of '../../home_screen.dart';

class _InfoTile extends StatelessWidget {
  final String grade;
  final String label;
  final String desc;
  final String price;

  const _InfoTile({
    required this.grade,
    required this.label,
    required this.desc,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop() => MediaQuery.of(context).size.width >= AppBreakpoints.lg;

    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                grade,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isDesktop()
                      ? MediaQuery.sizeOf(context).width * 0.01
                      : MediaQuery.sizeOf(context).width * 0.02,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(lightgrey)),
                ),
                child: Image.asset(
                  'lib/assets/images/iphone.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: isDesktop()
                        ? MediaQuery.sizeOf(context).width * 0.01
                        : MediaQuery.sizeOf(context).width * 0.025,
                  ),
                ),
                Text(
                  desc,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: isDesktop()
                        ? MediaQuery.sizeOf(context).width * 0.012
                        : MediaQuery.sizeOf(context).width * 0.025,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).width * 0.01),
                Text(
                  price,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 185, 41, 31),
                    fontSize: isDesktop()
                        ? MediaQuery.sizeOf(context).width * 0.015
                        : MediaQuery.sizeOf(context).width * 0.03,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).width * 0.05,
          right: MediaQuery.sizeOf(context).width * 0.02,
          child: Icon(
            Icons.visibility,
            size: isDesktop()
                ? MediaQuery.sizeOf(context).width * 0.02
                : MediaQuery.sizeOf(context).width * 0.04,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
