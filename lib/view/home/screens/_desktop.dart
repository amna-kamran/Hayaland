part of '../home_screen.dart';

class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(lightgrey)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int index = 0; index < items.length; index++)
                        Row(
                          children: [
                            _ExpandedContainer(
                              text: items[index],
                              height: MediaQuery.sizeOf(context).width * 0.03,
                              width: MediaQuery.sizeOf(context).width * 0.03,
                              fontSize: 14,
                              path: iconPaths[index],
                              borderColor: white,
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            if (index != items.length - 1)
                              const SizedBox(
                                height: 30,
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: Color(lightgrey),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Space.x),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.2,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: multipleNestedExpansionTiles(tileItems, 3),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearchField(
                          onChanged: (value) {},
                          fontSize: 14,
                          iconSize: 20,
                        ),
                        const SizedBox(height: Space.y1),
                        //remove
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: "100",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: SizedBox(
                                      width: 5.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Products",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.03,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.18,
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.sizeOf(context).width * 0.01,
                                    vertical: MediaQuery.sizeOf(context).width *
                                        0.005,
                                  ),
                                  child: const Text(
                                    "Displayed results: 24",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: Space.x2,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.03,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.18,
                                  child: CustomDropdown(
                                    dropDownValues: dropDownValues,
                                    dropdownValue: dropDownValues[0],
                                    onChanged: (String? value) {},
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                        const SizedBox(height: Space.y1),
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      MediaQuery.sizeOf(context).width <
                                              AppBreakpoints.xl
                                          ? 2
                                          : 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.6),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return const _InfoTile(
                              grade: "J GRADE",
                              label: "Apple",
                              desc:
                                  "[Junk] Apple | iPhone 13 Pro 128GB | SIM free",
                              price: "¥62,000",
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 10),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          backgroundColor: const Color(darkblue),
          child: SvgPicture.asset(
            'lib/assets/svgs/message.svg',
            width: 60,
            height: 60,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget multipleNestedExpansionTiles(List<List<String>> titles, int depth) {
    if (depth < 0 || titles.isEmpty) {
      return const SizedBox();
    } else {
      return ExpansionTile(
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(),
        title: Row(children: [
          Radio(
            value: titles.first.first,
            groupValue: "",
            onChanged: (value) {},
          ),
          Flexible(
            child: Text(
              titles.first.first,
              style: const TextStyle(fontSize: 12.0),
            ),
          ),
        ]),
        childrenPadding: const EdgeInsets.only(left: 20.0),
        iconColor: Colors.black,
        children: titles.first.length > 1
            ? [
                for (var i = 1; i < titles.first.length; i++)
                  ListTile(
                    shape: const RoundedRectangleBorder(),
                    iconColor: Colors.black,
                    contentPadding: const EdgeInsets.only(left: 20, right: 10),
                    title: Text(
                      titles.first[i],
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ),
              ]
            : [
                multipleNestedExpansionTiles(titles.sublist(1), depth - 1),
              ],
      );
    }
  }
}
