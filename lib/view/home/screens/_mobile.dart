part of '../home_screen.dart';

class _Mobile extends StatefulWidget {
  const _Mobile();

  @override
  State<_Mobile> createState() => _MobileState();
}

class _MobileState extends State<_Mobile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SmartphoneBloc>(context).add(LoadAllSmartphones());
    });
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
                      childAspectRatio: 6.5),
                  children: [
                    Container(
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
                    CustomDropDown(
                      height: MediaQuery.sizeOf(context).width * 0.07,
                      width: double.infinity,
                      fontSize: MediaQuery.sizeOf(context).width * 0.025,
                      iconSize: MediaQuery.sizeOf(context).width * 0.025,
                    ),
                  ],
                ),
                const SizedBox(height: Space.y1),
                RichText(
                  text: const TextSpan(
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
                BlocBuilder<SmartphoneBloc, SmartphoneState>(
                  builder: (context, state) {
                    if (state is SmartphonesLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is SmartphonesLoaded) {
                      return GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.5),
                        children: [
                          ...state.smartphones
                              .asMap()
                              .entries
                              .map((entry) => InfoTile(
                                    grade:
                                        entry.value.deviceDetails.grade ?? '',
                                    label: entry.value.label ?? '',
                                    desc: entry.value.desc ?? '',
                                    price: entry.value.price ?? '',
                                    pcl: entry.value.pcl,
                                    descFontSize: 14,
                                    priceFontSize: 20,
                                    onTap: () {
                                      onTap(entry.value);
                                    },
                                  )),
                        ],
                      );
                    } else if (state is SmartphoneError) {
                      return Text(state.message);
                    }
                    return Container();
                  },
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
