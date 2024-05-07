part of '../../home_screen.dart';

class CategoryExpanded extends StatefulWidget {
  final Widget? innerChild;
  final List<Widget>? innerChildren;
  final Widget? title;
  final double width;
  const CategoryExpanded({
    super.key,
    this.innerChild,
    this.title,
    this.innerChildren,
    required this.width,
  });

  @override
  State<CategoryExpanded> createState() => _CategoryExpandedState();
}

bool isExpanded = false;

class _CategoryExpandedState extends State<CategoryExpanded> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        setState(
          () {
            isExpanded = !isExpanded;
          },
        );
      },
      child: widget.title != null
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                    width: widget.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          isExpanded
                              ? CupertinoIcons.chevron_up
                              : CupertinoIcons.chevron_down,
                          size: 18,
                        ),
                        const SizedBox(
                          width: Space.x,
                        ),
                        Flexible(
                          child: widget.title ?? Container(),
                        ),
                      ],
                    ),
                  ),
                  isExpanded && widget.innerChildren != null
                      ? Column(
                          children: widget.innerChildren ?? [],
                        )
                      : Container(),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
              width: 200,
              child: widget.innerChild,
            ),
    );
  }
}
