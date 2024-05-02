part of '../home_screen.dart';

class _Mobile extends StatefulWidget {
  const _Mobile();

  @override
  State<_Mobile> createState() => _MobileState();
}

class _MobileState extends State<_Mobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const MobileAppBar(),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                              childAspectRatio: 5),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return _ExpandedContainer(
                          text: items[index],
                          height: MediaQuery.sizeOf(context).height * 0.04,
                          width: MediaQuery.sizeOf(context).width * 0.04,
                          fontSize: MediaQuery.sizeOf(context).width * 0.02,
                          path: iconPaths[index],
                          borderColor: lightgrey,
                          mainAxisAlignment: MainAxisAlignment.start,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: Space.x),
                GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing:
                          MediaQuery.of(context).size.width * 0.02,
                      mainAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                      childAspectRatio: 10,
                    ),
                    children: [
                      SearchField(
                        onChanged: (value) {},
                        fontSize: MediaQuery.sizeOf(context).width * 0.025,
                        iconSize: MediaQuery.sizeOf(context).width * 0.03,
                      ),
                    ]),
                const SizedBox(height: Space.x),
                GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 5),
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      margin: const EdgeInsets.symmetric(
                        vertical: 3.0,
                        horizontal: 3.0,
                      ),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(darkgrey)),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/assets/images/search.png",
                            width: MediaQuery.sizeOf(context).width * 0.035,
                            height: MediaQuery.sizeOf(context).width * 0.035,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: Space.x,
                          ),
                          Flexible(
                            child: Text(
                              "Narrow down",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize:
                                    MediaQuery.sizeOf(context).width * 0.025,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      margin: const EdgeInsets.symmetric(
                        vertical: 3.0,
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: CustomDropdown(
                        dropDownValues: dropDownValues,
                        dropdownValue: dropDownValues[0],
                        onChanged: (String? value) {},
                        iconSize: MediaQuery.sizeOf(context).width * 0.03,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Space.y1),
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
                const SizedBox(height: Space.y1),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const _InfoTile(
                      grade: "J GRADE",
                      label: "Apple",
                      desc: "[Junk] Apple | iPhone 13 Pro 128GB | SIM free",
                      price: "¥62,000",
                      onTap: null,
                    );
                  },
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
