part of '../../home_screen.dart';

class CategoryExpanded extends StatefulWidget {
  final innerChild;
  final innerChildren;
  final title;
  bool isExpanded;
  CategoryExpanded({
    super.key,
    this.innerChild,
    this.isExpanded = false,
    this.title,
    this.innerChildren,
  });

  @override
  State<CategoryExpanded> createState() => _CategoryExpandedState();
}

class _CategoryExpandedState extends State<CategoryExpanded> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        setState(
          () {
            widget.isExpanded = !widget.isExpanded;
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
                    width: 200,
                    child: Row(
                      children: [
                        Icon(
                          widget.isExpanded
                              ? CupertinoIcons.chevron_up
                              : CupertinoIcons.chevron_down,
                          size: 18,
                        ),
                        const SizedBox(
                          width: Space.x,
                        ),
                        Flexible(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.isExpanded && widget.innerChildren != null
                      ? Column(
                          children: widget.innerChildren,
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
