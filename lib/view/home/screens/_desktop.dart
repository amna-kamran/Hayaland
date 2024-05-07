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
    getData();
  }

  List<dynamic> appleItems = [];
  String selectedValue = dropDownValues[0];
  Map<String, dynamic> data = {};
  List<dynamic> filteredAppleItems = [];

  void getAppleItems() async {
    AppleProvider appleProvider = AppleProvider();

    List<dynamic> appleItems = await appleProvider.getApple();
    setState(
      () {
        this.appleItems = appleItems;
        filteredAppleItems = appleItems;
      },
    );
  }

  void getData() async {
    Map<String, dynamic> data = await Filter.loadAllData();
    setState(
      () {
        this.data = data;
      },
    );
  }

  void searchProducts(String query) {
    setState(
      () {
        if (query.isEmpty) {
          filteredAppleItems = appleItems;
        } else {
          String formattedQuery = query.replaceAll(' ', '').toLowerCase();
          filteredAppleItems = appleItems.where(
            (item) {
              String formattedDesc =
                  item.desc.replaceAll(' ', '').toLowerCase();
              return formattedDesc.contains(formattedQuery);
            },
          ).toList();
        }
      },
    );
  }

  onTap(Smartphone smartphone) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(phoneDetails: smartphone),
      ),
    );
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
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      child: CategoryExpanded(
                        width: 200,
                        title: const Text(
                          "カテゴリー",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        innerChildren: [
                          ...data.keys.toList().map(
                                (e) => CategoryExpanded(
                                  width: 200,
                                  title: Text(e),
                                  innerChildren: [
                                    for (var en in data[e]['models'].keys)
                                      CategoryExpanded(
                                        width: 200,
                                        title: Text(en),
                                        innerChildren: [
                                          for (var item in data[e]['models']
                                              [en])
                                            CategoryExpanded(
                                              width: 200,
                                              innerChild: Text(
                                                item,
                                              ),
                                            ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SearchField(
                            onChanged: searchProducts,
                            fontSize: 14,
                            iconSize: 20,
                          ),
                          const SizedBox(height: Space.y1),
                          //remove
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: filteredAppleItems.length.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                  ),
                                  children: const [
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
                              CustomDropDown(
                                height: 35,
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                fontSize: 14,
                                iconSize: 14,
                              ),
                            ],
                          ),

                          const SizedBox(height: Space.y1),
                          GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: MediaQuery.sizeOf(context).width <
                                      AppBreakpoints.lg
                                  ? 2
                                  : 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.6,
                            ),
                            children: [
                              ...filteredAppleItems.asMap().entries.map(
                                    (entry) => _InfoTile(
                                      grade: entry.value.grade ?? '',
                                      label: entry.value.label ?? '',
                                      desc: entry.value.desc ?? '',
                                      price: entry.value.price ?? '',
                                      onTap: () {
                                        onTap(entry.value);
                                      },
                                    ),
                                  ),
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
            ImagePaths.message,
            width: 60,
            height: 60,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
