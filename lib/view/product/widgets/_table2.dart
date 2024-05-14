part of '../product_screen.dart';

class _Table2 extends StatelessWidget {
  final bool isTablet;
  final bool isMobile;
  const _Table2({
    this.isTablet = false,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: const FlexColumnWidth(2),
        1: FlexColumnWidth(isMobile ? 3 : 2),
        2: FlexColumnWidth(isMobile ? 4 : 6),
      },
      border: TableBorder.all(
        color: Colors.black,
        width: 2,
      ),
      children: deviceGrade.map((row) {
        return TableRow(
          children: row.map((cell) {
            int rowIndex = deviceGrade.indexOf(row);
            int index = row.indexOf(cell);
            return TableCell(
              child: Container(
                color: index == 1 && rowIndex != 0
                    ? getColorForIndex(rowIndex - 1)
                    : Colors.white,
                padding: const EdgeInsets.all(15),
                child: Text(
                  cell,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isTablet ? 14 : 16,
                    color: rowIndex == 0
                        ? Colors.black
                        : (index == 1 ? Colors.white : const Color(0xFF717070)),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Color getColorForIndex(int index) {
    // Define shades of red based on index
    const List<Color> redShades = [
      Color(0xFFff0000),
      Color(0xFFcc0000),
      Color(0xFFe06666),
      Color(0xFFea9999),
      Color(0xFFe6b8af),
      Color(0xFFfdd8d0),
      Color(0xFF999999),
    ];
    return redShades[index % redShades.length]; // Loop for variation
  }
}
