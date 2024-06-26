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
  final onTap;

  const _Body({
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.grade.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.all(0.5),
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          const SizedBox(
            height: 10,
          ),
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFBCBCBC), width: 0.5),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Stack(
                children: [
                  Consumer<_ScreenState>(
                    builder: (context, provider, _) {
                      return ClipOval(
                        child: Image.asset(
                          provider.isHovered
                              ? 'lib/assets/images/iphone-back.jpg'
                              : 'lib/assets/images/iphone.jpg',
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            'lib/assets/images/hayaland.png',
                            width: isDesktop() ? 100 : 60,
                          ),
                          widget.pcl == "outlet"
                              ? Text(
                                  "OUTLET",
                                  style: TextStyle(
                                    fontSize: isDesktop() ? 8 : 5,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                child: Image.asset(
                                  "lib/assets/images/phonecheck.png",
                                  width: isDesktop() ? 50 : 50,
                                ),
                              ),
                            ],
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
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.label,
            style: TextStyle(
              color: Colors.grey,
              fontSize:
                  isDesktop() ? MediaQuery.sizeOf(context).width * 0.01 : 12,
            ),
          ),
          SizedBox(
            height: isDesktop() ? 40 : 65,
            child: Text(
              widget.desc,
              style: TextStyle(
                color: const Color(0xFF2D2D2D),
                fontSize: widget.descFontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            widget.price,
            style: TextStyle(
              color: const Color(0xFFd3122a),
              fontSize: widget.priceFontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
