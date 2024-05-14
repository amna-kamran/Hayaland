import 'package:flutter/material.dart';

class ExpandableContainer extends StatefulWidget {
  final String title;
  final Widget content;
  final bool isMobile;

  const ExpandableContainer({
    super.key,
    required this.title,
    required this.content,
    this.isMobile = false,
  });

  @override
  State<ExpandableContainer> createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double md = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(
              () {
                _isExpanded = !_isExpanded;
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(40.0),
            ),
            height: widget.isMobile ? md * 0.1 : md * 0.06,
            width: widget.isMobile ? double.infinity : md * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40),
                Expanded(
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: widget.isMobile ? md * 0.04 : md * 0.02,
                    ),
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: md * 0.68,
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(
                () {
                  _isExpanded = !isExpanded;
                },
              );
            },
            children: [
              ExpansionPanel(
                backgroundColor: Colors.white,
                hasIcon: false,
                isExpanded: _isExpanded,
                canTapOnHeader: true,
                body: widget.content,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
