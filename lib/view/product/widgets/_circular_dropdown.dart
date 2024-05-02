part of '../product_screen.dart';

class _CircularDropdown extends StatefulWidget {
  final String text;
  const _CircularDropdown({
    required this.text,
  });

  @override
  State<_CircularDropdown> createState() => _CircularDropdownState();
}

class _CircularDropdownState extends State<_CircularDropdown> {
  bool _expanded = false;
  void _toggle() {
    debugPrint(_expanded.toString());
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: _expanded ? MediaQuery.of(context).size.width * 0.5 : 0.0,
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: () => _toggle(),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), // Circular border
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).width * 0.015,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    _expanded
                        ? CupertinoIcons.chevron_down
                        : CupertinoIcons.chevron_up,
                    color: const Color.fromARGB(255, 15, 13, 13),
                    size: MediaQuery.sizeOf(context).width * 0.015,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.05,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              height: _expanded ? MediaQuery.of(context).size.width * 1 : 0.0,
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              color: Colors.amber,
              child: const Column(
                children: [
                  Text(
                    'Expanded Content',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Expanded Content',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Expanded Content',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
