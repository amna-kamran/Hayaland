import 'package:flutter/material.dart';
import 'package:web_task1/constants/colors.dart';
import 'package:web_task1/constants/drop_down_values.dart';

class DropDown extends StatefulWidget {
  final List<String> dropDownValues;
  const DropDown({
    super.key,
    required this.dropDownValues,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String _selectedOption = dropDownValues[0];
  bool _isDropdownOpen = false;

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  void _selectOption(String option) {
    setState(() {
      _selectedOption = option;
      _isDropdownOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: _toggleDropdown,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 3.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    width: MediaQuery.sizeOf(context).width * 0.18,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Text(_selectedOption)),
                        Icon(_isDropdownOpen
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_isDropdownOpen)
            Positioned(
              top: 320, // Adjust this value as needed
              left: 0,
              right: 0,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(lightgrey)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: dropDownValues
                      .map(
                        (option) => GestureDetector(
                          onTap: () => _selectOption(option),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: _selectedOption == option
                                  ? Colors.blue.withOpacity(0.2)
                                  : null,
                            ),
                            child: Text(option),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
