part of '../../home_screen.dart';

class _InfoTile extends StatefulWidget {
  final String grade;
  final String label;
  final String desc;
  final String price;
  final VoidCallback onTap;

  const _InfoTile({
    required this.grade,
    required this.label,
    required this.desc,
    required this.price,
    required this.onTap,
  });

  @override
  State<_InfoTile> createState() => _InfoTileState();
}

class _InfoTileState extends State<_InfoTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 100),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  bool hover = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
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

    setState(() {
      hover = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop() => MediaQuery.of(context).size.width >= AppBreakpoints.lg;

    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        onHover(value);
      },
      child: Column(
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
              widget.grade,
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
              child: Stack(children: [
                Image.asset(
                  hover
                      ? 'lib/assets/images/iphone-back.jpg'
                      : 'lib/assets/images/iphone.jpg',
                  fit: BoxFit.contain,
                ),
                Align(
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
                ),
              ]),
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
                  fontSize: isDesktop()
                      ? MediaQuery.sizeOf(context).width * 0.012
                      : MediaQuery.sizeOf(context).width * 0.025,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * 0.01),
              Text(
                widget.price,
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
    );
  }
}
