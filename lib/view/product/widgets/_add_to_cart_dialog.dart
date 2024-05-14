part of '../../product/product_screen.dart';

class _AddToCartDialog extends StatelessWidget {
  final String desc;
  final String price;
  final bool isMobile;
  const _AddToCartDialog({
    required this.desc,
    required this.price,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: Colors.black,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.close),
          ),
          isMobile
              ? Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                CupertinoIcons.check_mark_circled,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "カートに追加されました",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            "lib/assets/images/iphone.jpg",
                            width: 150,
                          ),
                          Text(
                            desc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            " 個の商品がカートに入っています",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "カートの小計: ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 116, 116, 116),
                              ),
                              children: [
                                TextSpan(
                                  text: '¥$price',
                                  style: const TextStyle(
                                    color: Color(0xFFd3122a),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  " ショッピングを続ける ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "カートに移動",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              color: const Color(0xFFd3122a),
                              child: const Center(
                                child: Text(
                                  "レジに進む",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                CupertinoIcons.check_mark_circled,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "カートに追加されました",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            "lib/assets/images/iphone.jpg",
                            width: 200,
                          ),
                          Text(
                            desc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            " 個の商品がカートに入っています",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "カートの小計: ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 116, 116, 116),
                              ),
                              children: [
                                TextSpan(
                                  text: '¥$price',
                                  style: const TextStyle(
                                    color: Color(0xFFd3122a),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  " ショッピングを続ける ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "カートに移動",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              color: const Color(0xFFd3122a),
                              child: const Center(
                                child: Text(
                                  "レジに進む",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
      contentTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }
}
