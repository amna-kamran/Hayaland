import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final List<Widget> children;
  final double dimensions;
  final double height;
  final double width;

  const CustomSlider({
    super.key,
    required this.children,
    required this.dimensions,
    required this.height,
    required this.width,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: widget.dimensions,
      initialPage: 40,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(widget.dimensions),
          height: widget.height,
          width: widget.width,
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.children.length,
                itemBuilder: (context, index) {
                  final actualIndex = (index + 2) % widget.children.length;
                  return widget.children[actualIndex];
                },
                onPageChanged: (index) {},
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
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      onPressed: () {
                        _pageController.nextPage(
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
}
