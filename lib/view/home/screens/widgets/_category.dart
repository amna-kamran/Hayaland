part of '../../home_screen.dart';

class CategoryExpanded extends StatelessWidget {
  const CategoryExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(),
      title: const Row(children: [
        Flexible(
          child: Text(
            "CATEGORY",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
      ]),
      iconColor: Colors.black,
      children: [
        ...tileItems.asMap().entries.map(
              (e) => ExpansionTile(
                backgroundColor: Colors.transparent,
                shape: const RoundedRectangleBorder(),
                title: Row(children: [
                  Radio(
                    value: "",
                    groupValue: "",
                    onChanged: (value) {},
                  ),
                  const Flexible(
                    child: Text(
                      "jnjds",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ]),
                childrenPadding: const EdgeInsets.only(left: 20.0),
                iconColor: Colors.black,
                children: const [],
              ),
            )
      ],
    );
  }
}
