part of '../product_screen.dart';

class _Mobile extends StatefulWidget {
  final Smartphone phoneDetails;
  const _Mobile({
    required this.phoneDetails,
  });
  //
  @override
  State<_Mobile> createState() => _MobileState();
}

class _MobileState extends State<_Mobile> {
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
            const MobileAppBar(),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.08,
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
                          onPressed: () {},
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
                Text(
                  "端末詳細",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: MediaQuery.sizeOf(context).width * 0.05,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.05,
                ),
                SizedBox(
                  width: double.infinity,
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
                                  fontSize:
                                      MediaQuery.sizeOf(context).width * 0.03,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                e.value,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.sizeOf(context).width * 0.03,
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
                _CircularDropdown(
                  height: MediaQuery.of(context).size.width * 0.11,
                  width: double.infinity,
                  text: "お支払い方法について",
                  fontSize: MediaQuery.sizeOf(context).width * 0.04,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.02,
                ),
                _CircularDropdown(
                  height: MediaQuery.of(context).size.width * 0.11,
                  width: double.infinity,
                  text: "お支払い方法について",
                  fontSize: MediaQuery.sizeOf(context).width * 0.04,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.02,
                ),
                _CircularDropdown(
                  height: MediaQuery.of(context).size.width * 0.11,
                  width: double.infinity,
                  text: "お支払い方法について",
                  fontSize: MediaQuery.sizeOf(context).width * 0.04,
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
