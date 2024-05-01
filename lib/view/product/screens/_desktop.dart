part of '../product_screen.dart';

class _Desktop extends StatefulWidget {
  const _Desktop();

  @override
  State<_Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<_Desktop> {
  bool isHoveredAdd = false;
  bool isHoveredBuy = false;
  bool isUnderline = false;
  void onHoveredAdd(bool value) {
    setState(() {
      isHoveredAdd = value;
    });
  }

  void onHoveredBuy(bool value) {
    setState(() {
      isHoveredBuy = value;
    });
  }

  void onHoverUnderline(bool value) {
    setState(() {
      isUnderline = value;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.015,
                ),
                const Text(
                  "STRADE [Home]→ 2. Outlet→  Smartphone → iPhone→  iPhone 13 Pro→ [Junk goods] Apple|iPhone 13 Pro 128GB|SIM Free",
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.03,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(darkgrey),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          HoverToZoom(
                            imagePath: 'lib/assets/images/iphone.jpg',
                            dimension: MediaQuery.sizeOf(context).width * 0.4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          child: const Text(
                            "[Junk goods] Apple|iPhone 13 Pro 128GB|SIM Free",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
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
                            "J GRADE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.sizeOf(context).width * 0.015,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).width * 0.01,
                        ),
                        Text(
                          "¥62,000",
                          style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).width * 0.018,
                            fontWeight: FontWeight.bold,
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
                            Icon(
                              CupertinoIcons.mail,
                              size: MediaQuery.sizeOf(context).width * 0.015,
                              color: Colors.black87,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.005,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              child: InkWell(
                                onTap: () {},
                                onHover: (value) => onHoverUnderline(value),
                                child: Text(
                                  "Contact us Through Email for Product Inquiries",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    decoration: isUnderline
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
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
                            width: MediaQuery.sizeOf(context).width * 0.15,
                            height: MediaQuery.sizeOf(context).width * 0.04,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                ),
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => isHoveredAdd
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              onPressed: () {},
                              onHover: (value) => onHoveredAdd(value),
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(
                                  color: isHoveredAdd
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize:
                                      MediaQuery.sizeOf(context).width * 0.012,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).width * 0.01,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: MediaQuery.sizeOf(context).width * 0.04,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              backgroundColor: MaterialStateColor.resolveWith(
                                (states) => isHoveredBuy
                                    ? const Color(0xFF4422BF)
                                    : const Color(0xFF5A31F4),
                              ),
                            ),
                            onPressed: () {},
                            onHover: (value) => onHoveredBuy(value),
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.sizeOf(context).width * 0.012,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.1,
                ),
                Text(
                  "Device Details",
                  style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).width * 0.02,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
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
                      ...phoneDetails.asMap().entries.map(
                            (e) => TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    e.value.title,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.sizeOf(context).width *
                                              0.015,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    e.value.value,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.sizeOf(context).width *
                                              0.015,
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
