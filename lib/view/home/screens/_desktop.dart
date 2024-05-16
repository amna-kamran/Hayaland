part of '../home_screen.dart';

class _Desktop extends StatefulWidget {
  const _Desktop();

  @override
  State<_Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<_Desktop> {
  bool isTablet() =>
      MediaQuery.sizeOf(context).width < AppBreakpoints.lg &&
      MediaQuery.sizeOf(context).width > AppBreakpoints.xs;
  ScrollController sc = ScrollController(initialScrollOffset: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SmartphoneBloc>(context).add(LoadAllSmartphones());
    });

    sc.addListener(_scrollListener);
  }

  String selectedValue = dropDownValues[0];
  Map<String, dynamic> data = {};

  onTap(Smartphone smartphone) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(phoneDetails: smartphone),
      ),
    );
  }

  void _scrollListener() {
    BlocProvider.of<AppBarBloc>(context)
        .add(ScrollPositionChanged(sc.position.pixels));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AnimatedAppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            BlocBuilder<AppBarBloc, AppBarState>(
              builder: (context, state) {
                bool showAppBar = true;
                if (state is ScrollPositionState) {
                  showAppBar = !state.isAboveThreshold;
                }

                if (showAppBar) {
                  return const SliverAppBar(
                    pinned: false,
                    backgroundColor: Colors.pink,
                    title: ExpandedAppBar(),
                    bottom: BottomAppBar2(),
                  );
                }

                return SliverToBoxAdapter(
                  child: Container(),
                );
              },
            )
          ];
        },
        body: SingleChildScrollView(
          controller: sc,
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
                          // SearchField(
                          //   onChanged: Stri
                          //   fontSize: 14,
                          //   iconSize: 20,
                          // ),
                          const SizedBox(height: Space.y1),
                          //remove
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  // text: filteredAppleItems.length.toString(),
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
                              CustomDropDown(
                                height: 35,
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                fontSize: 14,
                                iconSize: 14,
                              ),
                            ],
                          ),

                          const SizedBox(height: Space.y1),

                          BlocBuilder<SmartphoneBloc, SmartphoneState>(
                            builder: (context, state) {
                              if (state is SmartphonesLoading) {
                                return const CircularProgressIndicator();
                              } else if (state is SmartphonesLoaded) {
                                return GridView(
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
                                    childAspectRatio: 0.5,
                                  ),
                                  children: [
                                    ...state.smartphones.asMap().entries.map(
                                          (entry) => InfoTile(
                                            grade: entry.value.deviceDetails
                                                    .grade ??
                                                '',
                                            label: entry.value.label ?? '',
                                            desc: entry.value.desc ?? '',
                                            price: entry.value.price ?? '',
                                            pcl: entry.value.pcl,
                                            descFontSize: isTablet() ? 20 : 14,
                                            priceFontSize: isTablet() ? 25 : 20,
                                            gradeFontSize: 20,
                                            onTap: () {
                                              onTap(entry.value);
                                            },
                                          ),
                                        ),
                                  ],
                                );
                              } else if (state is SmartphoneError) {
                                return Text(state.message);
                              }
                              return Container();
                            },
                          )
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
      floatingActionButton: const FloatingMessageButton(),
    );
  }
}
