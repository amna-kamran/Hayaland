part of '../product_screen.dart';

class _Table1 extends StatelessWidget {
  final Map<String, dynamic>? deviceDetails;
  final bool isTablet;
  const _Table1({
    required this.deviceDetails,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
      },
      border: TableBorder.all(
        color: Colors.black,
        width: 2,
      ),
      children: [
        ...deviceDetails!.entries.map(
          (e) => TableRow(
            children: [
              Container(
                color: const Color(lightgrey),
                padding: const EdgeInsets.all(15),
                child: Text(
                  e.key,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: isTablet
                        ? 14
                        : MediaQuery.sizeOf(context).width * 0.012,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  e.value,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: isTablet
                        ? 14
                        : MediaQuery.sizeOf(context).width * 0.012,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
