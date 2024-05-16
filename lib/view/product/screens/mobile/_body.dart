part of '../../product_screen.dart';

class _BodyMobile extends StatefulWidget {
  final Smartphone phoneDetails;
  const _BodyMobile({
    required this.phoneDetails,
  });
  //
  @override
  State<_BodyMobile> createState() => _BodyMobileState();
}

class _BodyMobileState extends State<_BodyMobile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SmartphoneBloc>(context).add(LoadAllSmartphones());
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? deviceDetails =
        widget.phoneDetails.deviceDetails?.toJson();
    final md = MediaQuery.sizeOf(context).width;
    final productScreenProvider = Provider.of<_ScreenState>(context);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const MobileAppBar(),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.015,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.sizeOf(context).width * 0.06,
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    "STRADE [Home]→ 2. Outlet→  Smartphone → iPhone→  iPhone 13 Pro→ [Junk goods] Apple|iPhone 13 Pro 128GB|SIM Free",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.03,
                ),
                const _ImageSlider(
                  dimensions: 400,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.phoneDetails.desc ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).width * 0.01,
                    ),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.sizeOf(context).width * 0.01),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey),
                      child: Text(
                        widget.phoneDetails.grade ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).width * 0.02,
                    ),
                    Text(
                      widget.phoneDetails.price ?? '',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 185, 41, 31),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).width * 0.001,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      child: const Divider(
                        thickness: 1,
                        color: Color(lightgrey),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).width * 0.01,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.mail,
                          size: MediaQuery.sizeOf(context).width * 0.04,
                          color: Colors.black87,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.005,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              "この商品への質問",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                decorationThickness: 2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.001,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).width * 0.01,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).width * 0.1,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                                side: const BorderSide(color: Colors.black),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => _AddToCartDialog(
                                isMobile: true,
                                desc: widget.phoneDetails.desc ?? '',
                                price: widget.phoneDetails.price ?? '',
                              ),
                            );
                          },
                          child: const Text(
                            "カートに入れる",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).width * 0.03,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).width * 0.1,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF4422BF),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        productScreenProvider.setTableIndex(0);
                      },
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: const Text(
                        "端末詳細",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(width: Space.x2),
                    InkWell(
                      onTap: () {
                        productScreenProvider.setTableIndex(1);
                      },
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: const Text(
                        "グレーディング基準",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.05,
                ),
                productScreenProvider.tableIndex == 0
                    ? _Table1(deviceDetails: deviceDetails)
                    : const _Table2(
                        isMobile: true,
                      ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "関連商品",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                BlocBuilder<SmartphoneBloc, SmartphoneState>(
                  builder: (context, state) {
                    if (state is SmartphonesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SmartphonesLoaded) {
                      return CustomSlider(
                        height: 300,
                        width: double.infinity,
                        dimensions: 0.35,
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
                                    descFontSize:
                                        MediaQuery.sizeOf(context).width * 0.02,
                                    priceFontSize: md * 0.03,
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
                  height: MediaQuery.sizeOf(context).width * 0.11,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "ユーザガイド",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.sizeOf(context).width * 0.04,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.02,
                ),
                const ExpandableContainer(
                  isMobile: true,
                  title: "お支払い方法について",
                  content: DropDownTable1(
                    isColumn: true,
                  ),
                ),
                SizedBox(
                  height: md * 0.02,
                ),
                const ExpandableContainer(
                  isMobile: true,
                  title: "配送について",
                  content: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: md * 0.02,
                ),
                const ExpandableContainer(
                  isMobile: true,
                  title: "商品について",
                  content: DropDownTable1(
                    isColumn: true,
                  ),
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
