// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'desktop_appbar.dart';

class _HoverButton extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const _HoverButton({
    required this.builder,
  });

  @override
  State<_HoverButton> createState() => __HoverButtonState();
}

class __HoverButtonState extends State<_HoverButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: widget.builder(isHovered),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
