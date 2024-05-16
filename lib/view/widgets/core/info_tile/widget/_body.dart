part of '../info_tile.dart';

class _Body extends StatefulWidget {
  final String grade;
  final String label;
  final String desc;
  final String price;
  final String pcl;
  final bool eyeicon;
  final double descFontSize;
  final double priceFontSize;
  final double gradeFontSize;
  final VoidCallback onTap;

  const _Body({
    super.key,
    required this.grade,
    required this.label,
    required this.desc,
    required this.price,
    this.pcl = "outlet",
    required this.onTap,
    this.eyeicon = true,
    this.descFontSize = 20,
    this.priceFontSize = 14,
    this.gradeFontSize = 14,
  });

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 100),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onHover(bool value) {
    if (value) {
      _controller.forward(from: 0.0);
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<_ScreenState>(context);
    bool isDesktop() => MediaQuery.of(context).size.width >= AppBreakpoints.lg;

    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: widget.onTap,
      onHover: (value) {
        imageProvider.setIsHovered(value);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widget.grade.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: GradeColors.getColorForGrade(widget.grade),
                    border: Border.all(
                      color: GradeColors.getColorForGrade(widget.grade),
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    ' ${widget.grade} グレード ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.gradeFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : Container(),
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(lightgrey)),
              ),
              child: Stack(
                children: [
                  Consumer<_ScreenState>(
                    builder: (context, provider, _) {
                      return Image.asset(
                        provider.isHovered
                            ? 'lib/assets/images/iphone-back.jpg'
                            : 'lib/assets/images/iphone.jpg',
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            'lib/assets/images/hayaland.png',
                            width: 80,
                          ),
                          widget.pcl == "outlet"
                              ? const Text(
                                  "OUTLET",
                                  style: TextStyle(
                                    fontSize: 6,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 4,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  widget.pcl != "outlet"
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "lib/assets/images/phonecheck.png",
                                  width: isDesktop() ? 50 : 30,
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  widget.eyeicon
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: isDesktop()
                                ? EdgeInsets.all(
                                    MediaQuery.sizeOf(context).width * 0.01)
                                : EdgeInsets.all(
                                    MediaQuery.sizeOf(context).width * 0.02),
                            child: isDesktop()
                                ? ScaleTransition(
                                    scale: _animation,
                                    child: const VisibilityIcon(),
                                  )
                                : const VisibilityIcon(),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: isDesktop()
                      ? MediaQuery.sizeOf(context).width * 0.01
                      : MediaQuery.sizeOf(context).width * 0.025,
                ),
              ),
              Text(
                widget.desc,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: widget.descFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * 0.01),
              Text(
                widget.price,
                style: TextStyle(
                  color: const Color.fromARGB(255, 185, 41, 31),
                  fontSize: widget.priceFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
