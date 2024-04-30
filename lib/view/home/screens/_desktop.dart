part of '../home_screen.dart';

class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    debugPrint(AppleProvider().getApple().toString());
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: MediaQuery.sizeOf(context).width * 0.115,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                expandedTitleScale: 1,
                background: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 90,
                      color: Colors.white,
                      child: Image.asset(
                        'lib/assets/images/hayaland.png',
                        width: MediaQuery.sizeOf(context).width * 0.15,
                        height: MediaQuery.sizeOf(context).width * 0.15,
                      ),
                    ),
                  ],
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...menu.asMap().entries.map(
                            (entry) => HoverButton(
                              builder: (isHovered) => Text(
                                entry.value,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.sizeOf(context).width * 0.013,
                                  color: isHovered
                                      ? Colors.white
                                      : const Color(darkgrey),
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.black,
            ),
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
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: const CategoryExpanded(),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SearchField(
                            onChanged: (value) {},
                            fontSize: 14,
                            iconSize: 20,
                          ),
                          const SizedBox(height: Space.y1),
                          //remove
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                      vertical: 5.0,
                                    ),
                                    child: const Text(
                                      "Displayed results: 24",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: Space.x2,
                                  ),
                                  const DropDown(
                                    dropDownValues: dropDownValues,
                                  ),
                                ],
                              )
                            ],
                          ),

                          const SizedBox(height: Space.y1),
                          GridView.builder(
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
                                    childAspectRatio: 0.6),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return const _InfoTile(
                                grade: "J GRADE",
                                label: "Apple",
                                desc:
                                    "[Junk] Apple | iPhone 13 Pro 128GB | SIM free",
                                price: "¥62,000",
                              );
                            },
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
