// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../home_screen.dart';

class _Desktop extends StatefulWidget {
  const _Desktop();

  @override
  State<_Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<_Desktop> {
  @override
  void initState() {
    super.initState();
    getAppleItems();
  }

  List<dynamic> appleItems = [];

  void getAppleItems() async {
    AppleProvider appleProvider = AppleProvider();

    List<dynamic> appleItems = await appleProvider.getApple();
    setState(() {
      this.appleItems = appleItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const DesktopAppBar(),
          ];
        },
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...items.asMap().entries.map(
                            (entry) => Row(
                              children: [
                                _ExpandedContainer(
                                  text: entry.value,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.03,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.03,
                                  fontSize: 14,
                                  path: iconPaths[entry.key],
                                  borderColor: white,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                                if (entry.key != items.length - 1)
                                  const SizedBox(
                                    height: 30,
                                    child: VerticalDivider(
                                      thickness: 1,
                                      color: Color(lightgrey),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                    ],
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
                      child: const CategoryExpanded(),
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
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                      vertical: 5.0,
                                    ),
                                    child: const Text(
                                      "Displayed results: 24",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: Space.x2,
                                  ),
                                  const DropDown(
                                    dropDownValues: dropDownValues,
                                  ),
                                ],
                              )
                            ],
                          ),

                          const SizedBox(height: Space.y1),
                          GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        MediaQuery.sizeOf(context).width <
                                                AppBreakpoints.lg
                                            ? 2
                                            : 4,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.6),
                            children: [
                              ...appleItems
                                  .asMap()
                                  .entries
                                  .map((entry) => InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/product',
                                            arguments: DeviceDetails(
                                                entry.value.deviceDetails
                                                    .deviceType,
                                                entry.value.deviceDetails.model,
                                                entry.value.deviceDetails
                                                    .imeiNumber,
                                                entry.value.deviceDetails
                                                    .carrier,
                                                entry.value.deviceDetails.color,
                                                entry.value.deviceDetails
                                                    .maximumBatteryCapacity,
                                                entry.value.deviceDetails
                                                    .accessories,
                                                entry.value.deviceDetails
                                                    .malfunction,
                                                entry.value.deviceDetails.grade,
                                                entry.value.deviceDetails
                                                    .exteriorDetails),
                                          );
                                        },
                                        child: _InfoTile(
                                          grade: entry.value.grade ?? '',
                                          label: entry.value.label ?? '',
                                          desc: entry.value.desc ?? '',
                                          price: entry.value.price ?? '',
                                        ),
                                      )),
                            ],
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
}
