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

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? deviceDetails =
        widget.phoneDetails.deviceDetails?.toJson();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            MediaQuery.sizeOf(context).width < AppBreakpoints.lg
                ? const MobileAppBar()
                : const DesktopAppBar(),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.015,
                ),
                Container(
                  padding: isTablet()
                      ? EdgeInsets.symmetric(
                          vertical: MediaQuery.sizeOf(context).width * 0.05,
                        )
                      : EdgeInsets.zero,
                  width: isTablet()
                      ? MediaQuery.sizeOf(context).width * 0.6
                      : MediaQuery.sizeOf(context).width * 1,
                  child: const Text(
                    textAlign: TextAlign.center,
                    "STRADE [Home]→ 2. Outlet→  Smartphone → iPhone→  iPhone 13 Pro→ [Junk goods] Apple|iPhone 13 Pro 128GB|SIM Free",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _ImageSlider(
                      dimensions: 490,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          child: Text(
                            widget.phoneDetails.desc ?? '',
                            style: TextStyle(
                              fontSize: isTablet() ? 18 : 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).width * 0.01,
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              MediaQuery.sizeOf(context).width * 0.004),
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
                          height: MediaQuery.sizeOf(context).width * 0.01,
                        ),
                        Text(
                          widget.phoneDetails.price ?? '',
                          style: TextStyle(
                            fontSize: isTablet()
                                ? MediaQuery.sizeOf(context).width * 0.03
                                : 28,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 185, 41, 31),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).width * 0.005,
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
                            const Icon(
                              CupertinoIcons.mail,
                              size: 12,
                              color: Colors.black87,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.005,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.4,
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
                              width: MediaQuery.sizeOf(context).width * 0.001,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).width * 0.01,
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
                          height: MediaQuery.sizeOf(context).width * 0.01,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.3,
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
                  height: MediaQuery.sizeOf(context).width * 0.04,
                ),
                Text(
                  "端末詳細",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: MediaQuery.sizeOf(context).width * 0.02,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.02,
                ),
                SizedBox(
                  width: isTablet()
                      ? MediaQuery.sizeOf(context).width * 0.6
                      : MediaQuery.sizeOf(context).width * 0.5,
                  child: Table(
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
                                  fontSize: isTablet()
                                      ? 14
                                      : MediaQuery.sizeOf(context).width *
                                          0.012,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                e.value,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: isTablet()
                                      ? 14
                                      : MediaQuery.sizeOf(context).width *
                                          0.012,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.1,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  height: MediaQuery.sizeOf(context).width * 0.06,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: Center(
                    child: Text(
                      "ユーザガイド",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.sizeOf(context).width * 0.02,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.02,
                ),
                _CircularDropdown(
                  height: MediaQuery.of(context).size.width * 0.05,
                  width: MediaQuery.of(context).size.width * 0.6,
                  text: "お支払い方法について",
                  fontSize: MediaQuery.sizeOf(context).width * 0.015,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.02,
                ),
                _CircularDropdown(
                  height: MediaQuery.of(context).size.width * 0.05,
                  width: MediaQuery.of(context).size.width * 0.6,
                  text: "お支払い方法について",
                  fontSize: MediaQuery.sizeOf(context).width * 0.015,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.02,
                ),
                _CircularDropdown(
                  height: MediaQuery.of(context).size.width * 0.05,
                  width: MediaQuery.of(context).size.width * 0.6,
                  text: "お支払い方法について",
                  fontSize: MediaQuery.sizeOf(context).width * 0.015,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.02,
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
