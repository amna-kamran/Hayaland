part of '../../product_screen.dart';

class _BodyDesktop extends StatefulWidget {
  final Smartphone phoneDetails;
  const _BodyDesktop({
    required this.phoneDetails,
  });

  @override
  State<_BodyDesktop> createState() => _BodyDesktopState();
}

class _BodyDesktopState extends State<_BodyDesktop> {
  bool isTablet() =>
      MediaQuery.sizeOf(context).width < AppBreakpoints.lg &&
      MediaQuery.sizeOf(context).width > AppBreakpoints.xs;
  ScrollController sc = ScrollController(initialScrollOffset: 0);
  @override
  void initState() {
    super.initState();

    sc.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SmartphoneBloc>(context).add(LoadAllSmartphones());
    });
  }

  void _scrollListener() {
    BlocProvider.of<AppBarBloc>(context)
        .add(ScrollPositionChanged(sc.position.pixels));
  }

  @override
  Widget build(BuildContext context) {
    final productScreenProvider = Provider.of<_ScreenState>(context);
    final md = MediaQuery.sizeOf(context).width;
    Map<String, dynamic>? deviceDetails =
        widget.phoneDetails.deviceDetails?.toJson();

    return Scaffold(
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
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading: false,
                    title: ExpandedAppBar(),
                    bottom: BottomAppBar2(),
                  );
                } else {
                  return const SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.black,
                    automaticallyImplyLeading: false,
                    title: BottomAppBar2(),
                  );
                }
              },
            )
          ];
        },
        body: SingleChildScrollView(
          controller: sc,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: md * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: md * 0.015,
                ),
                Container(
                  padding: isTablet()
                      ? EdgeInsets.symmetric(
                          vertical: md * 0.05,
                        )
                      : EdgeInsets.zero,
                  width: isTablet() ? md * 0.6 : md * 1,
                  child: const Text(
                    textAlign: TextAlign.center,
                    "STRADE [Home]→ 2. Outlet→  Smartphone → iPhone→  iPhone 13 Pro→ [Junk goods] Apple|iPhone 13 Pro 128GB|SIM Free",
                  ),
                ),
                SizedBox(
                  height: md * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ImageSlider(
                      dimensions: 490,
                      pcl: widget.phoneDetails.pcl ?? '',
                    ),
                    SizedBox(
                      width: md * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: md * 0.4,
                          child: Text(
                            widget.phoneDetails.desc ?? '',
                            style: TextStyle(
                              fontSize: isTablet() ? 18 : 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: md * 0.01,
                        ),
                        Container(
                          padding: EdgeInsets.all(md * 0.004),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: GradeColors.getColorForGrade(
                                  widget.phoneDetails.deviceDetails?.grade ??
                                      "")),
                          child: Text(
                            '${widget.phoneDetails.deviceDetails?.grade} グレード ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isTablet() ? 16 : 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: md * 0.01,
                        ),
                        Text(
                          widget.phoneDetails.price ?? '',
                          style: TextStyle(
                            fontSize: isTablet() ? md * 0.03 : 28,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 185, 41, 31),
                          ),
                        ),
                        SizedBox(
                          height: md * 0.005,
                        ),
                        SizedBox(
                          width: md * 0.4,
                          child: const Divider(
                            thickness: 1,
                            color: Color(lightgrey),
                          ),
                        ),
                        SizedBox(
                          height: md * 0.01,
                        ),
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.mail,
                              size: 12,
                              color: Colors.black87,
                            ),
                            SizedBox(
                              width: md * 0.005,
                            ),
                            SizedBox(
                              width: md * 0.4,
                              child: InkWell(
                                onTap: () {},
                                child: const Text(
                                  "この商品への質問",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    decorationThickness: 2,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: md * 0.001,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: md * 0.01,
                        ),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onHover: (value) {
                              productScreenProvider.setIsHovered(value);
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  side: const BorderSide(color: Colors.black),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  productScreenProvider.isCartButtonHovered
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Colors.black),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => _AddToCartDialog(
                                  desc: widget.phoneDetails.desc ?? '',
                                  price: widget.phoneDetails.price ?? '',
                                ),
                              );
                            },
                            child: Text(
                              "カートに入れる",
                              style: TextStyle(
                                color: productScreenProvider.isCartButtonHovered
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: md * 0.01,
                        ),
                        SizedBox(
                          width: md * 0.4,
                          height: 50,
                          child: ElevatedButton(
                              onHover: (value) {
                                productScreenProvider
                                    .setIsShopButtonHovered(value);
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  productScreenProvider.isShopButtonHovered
                                      ? const Color(0xFF391CA1)
                                      : const Color(0xFF4422BF),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "lib/assets/svgs/shoppay.svg",
                                    width: 80,
                                  ),
                                  const Text(
                                    " で購入",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: md * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onHover: (value) {
                        productScreenProvider.setIsTableTitleHovered0(value);
                      },
                      onTap: () {
                        productScreenProvider.setTableIndex(0);
                      },
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: Text(
                        "端末詳細",
                        style: TextStyle(
                          color: productScreenProvider.isTableTitleHovered0
                              ? Colors.black
                              : productScreenProvider.tableIndex == 0
                                  ? Colors.black
                                  : Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(width: Space.x1),
                    InkWell(
                      onHover: (value) {
                        productScreenProvider.setIsTableTitleHovered1(value);
                      },
                      onTap: () {
                        productScreenProvider.setTableIndex(1);
                      },
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: Text(
                        "グレーディング基準",
                        style: TextStyle(
                          color: productScreenProvider.isTableTitleHovered1
                              ? Colors.black
                              : productScreenProvider.tableIndex == 1
                                  ? Colors.black
                                  : Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                productScreenProvider.tableIndex == 0
                    ? SizedBox(
                        width: 750,
                        child: _Table1(deviceDetails: deviceDetails),
                      )
                    : const SizedBox(
                        width: 750,
                        child: _Table2(),
                      ),
                //pg
                const SizedBox(height: 30),
                Text(
                  "関連商品",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: isTablet() ? 35 : md * 0.02,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<SmartphoneBloc, SmartphoneState>(
                  builder: (context, state) {
                    if (state is SmartphonesLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is SmartphonesLoaded) {
                      return CustomSlider(
                        height: isTablet() ? md * 0.42 : md * 0.35,
                        width: double.infinity,
                        dimensions: 0.2,
                        children: [
                          ...state.smartphones.asMap().entries.map(
                                (entry) => Container(
                                  padding: const EdgeInsets.all(20),
                                  child: InfoTile(
                                    eyeicon: false,
                                    grade: '',
                                    label: '',
                                    desc: entry.value.desc ?? '',
                                    price: entry.value.price ?? '',
                                    pcl: entry.value.pcl,
                                    descFontSize: isTablet() ? 12 : 16,
                                    priceFontSize: isTablet() ? 16 : 20,
                                    onTap: () {
                                      entry.value;
                                    },
                                  ),
                                ),
                              ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  height: md * 0.06,
                  width: md * 0.9,
                  child: Center(
                    child: Text(
                      "ユーザガイド",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: md * 0.02,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: md * 0.02,
                ),

                const ExpandableContainer(
                  title: "お支払い方法について",
                  content: DropDownTable1(),
                ),
                SizedBox(
                  height: md * 0.02,
                ),
                ExpandableContainer(
                  title: "配送について",
                  content: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 500,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 500,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: md * 0.02,
                ),
                const ExpandableContainer(
                  title: "商品について",
                  content: DropDownTable1(),
                ),
                SizedBox(
                  height: md * 0.05,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const FloatingMessageButton(),
    );
  }
}
