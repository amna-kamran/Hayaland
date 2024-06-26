part of '../product_screen.dart';

class _ImageSlider extends StatefulWidget {
  final double dimensions;
  final String pcl;
  const _ImageSlider({this.dimensions = 0.0, this.pcl = "outlet"});

  @override
  State<_ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<_ImageSlider> {
  final _controller = PageController(
    viewportFraction: 0.2,
    initialPage: 99,
  );

  final List images = [
    "lib/assets/images/iphone.jpg",
    "lib/assets/images/iphone-back.jpg",
    "lib/assets/images/phone-front.jpg",
    "lib/assets/images/phone-front-on.jpg",
    "lib/assets/images/device-info.png",
  ];
  final List selectedInterests = [];
  int builderIndex = 0;
  int selectedIndex = 0;
  void _setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _setBuilderIndex(int index) {
    setState(
      () {
        builderIndex = index;
      },
    );
  }

  bool isTablet() =>
      MediaQuery.sizeOf(context).width < AppBreakpoints.lg &&
      MediaQuery.sizeOf(context).width > AppBreakpoints.xs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xDDADADAD),
              width: 0.5,
            ),
          ),
          child: HoverToZoom(
            imagePath: images[selectedIndex],
            dimension: isTablet() ? 310 : widget.dimensions,
            pcl: widget.pcl,
          ),
        ),
        SizedBox(
          height: isTablet() ? 65 : 100,
          width: isTablet() ? 310 : widget.dimensions,
          child: Stack(
            children: [
              PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, int currentIdx) {
                  int crt = currentIdx % images.length;
                  return Container(
                    child: _buildPageItem(images[crt], currentIdx),
                  );
                },
                controller: _controller,
                onPageChanged: (index) {
                  _setBuilderIndex(index);
                },
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        _setIndex((builderIndex - 1) % images.length);
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        _setIndex((builderIndex + 1) % images.length);
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector _buildPageItem(String boxItem, int crt) {
    bool isSelected = crt % images.length == selectedIndex;
    double opacity = isSelected ? 1.0 : 0.5;

    return GestureDetector(
      onTap: () {
        _setIndex(crt % images.length);
        _controller.animateToPage(
          crt = crt + 2,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Opacity(
        opacity: opacity,
        child: Container(
          margin: EdgeInsets.all(isTablet() ? 5 : 8),
          height: isTablet() ? 20 : 50,
          width: isTablet() ? 20 : 50,
          child: Image.asset(
            boxItem,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
