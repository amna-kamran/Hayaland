part of '../product_screen.dart';

class _Desktop extends StatefulWidget {
  final Smartphone phoneDetails;
  const _Desktop({
    required this.phoneDetails,
  });
  //
  @override
  State<_Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<_Desktop> {
  bool isTablet() =>
      MediaQuery.sizeOf(context).width < AppBreakpoints.lg &&
      MediaQuery.sizeOf(context).width > AppBreakpoints.xs;
  final _controller = PageController(
    viewportFraction: 1,
    initialPage: 0,
  );
  int selectedIndex = 0;
  void _setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final md = MediaQuery.sizeOf(context).width;
    Map<String, dynamic>? deviceDetails =
        widget.phoneDetails.deviceDetails?.toJson();
    final List page = [
      _Table1(deviceDetails: deviceDetails, isTablet: isTablet()),
      _Table2(isTablet: isTablet()),
    ];

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            md < AppBreakpoints.lg
                ? const MobileAppBar()
                : const DesktopAppBar(),
          ];
        },
        body: SingleChildScrollView(
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
                    const _ImageSlider(
                      dimensions: 490,
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
                              color: Colors.grey),
                          child: Text(
                            widget.phoneDetails.grade ?? '',
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
                              onPressed: () {},
                              child: const Text(
                                "カートに入れる",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: md * 0.01,
                        ),
                        SizedBox(
                          width: md * 0.3,
                          height: 50,
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
                                fontSize: 16,
                              ),
                            ),
                          ),
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
                      onTap: () {
                        _setIndex(0);
                      },
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: Text(
                        "端末詳細",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.sizeOf(context).width * 0.02,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(width: Space.x2),
                    InkWell(
                      onTap: () {
                        _setIndex(1);
                      },
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: Text(
                        "2nd",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.sizeOf(context).width * 0.02,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Space.y,
                ),
                //pg
                SizedBox(
                  height: md * 0.5,
                  width: isTablet() ? md * 0.6 : md * 0.6,
                  child: PageView.builder(
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return (page[selectedIndex]);
                    },
                  ),
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
                CategoryExpanded(
                  width: 300,
                  title: const Text(
                    "お支払い方法について",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  innerChildren: [
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1),
                      },
                      border: TableBorder.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                textAlign: TextAlign.center,
                                "クレジットカード決済クレジットカードをご利用いただけます。",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: isTablet() ? 14 : md * 0.012,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                textAlign: TextAlign.center,
                                "仮想通貨送金仮想通貨（リップル）をご利用いただけます。",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: isTablet() ? 14 : md * 0.012,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                textAlign: TextAlign.center,
                                "銀行口座振込銀行振込をご利用いただけます。",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: isTablet() ? 14 : md * 0.012,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: md * 0.05,
                )
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
