import 'package:flutter/material.dart';

class DropDownTable1 extends StatelessWidget {
  final bool isColumn;
  const DropDownTable1({super.key, this.isColumn = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        !isColumn
            ? Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  'クレジットカード決済',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const Text(
                                  'クレジットカードをご利用いただけます。',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Image.network(
                                    "https://cdn.shopify.com/s/files/1/0640/5662/3350/files/visa-p.jpg?v=1655810204"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            children: [
                              const Text(
                                '仮想通貨送金',
                                style: TextStyle(color: Colors.black),
                              ),
                              const Text(
                                '仮想通貨（リップル）をご利用いただけます。',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Image.network(
                                  "https://cdn.shopify.com/s/files/1/0640/5662/3350/files/ripple-3.jpg?v=1655810795"),
                            ],
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Text(
                                '銀行口座振込',
                                style: TextStyle(color: Colors.black),
                              ),
                              const Text(
                                '銀行振込をご利用いただけます。',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              Image.network(
                                  "https://cdn.shopify.com/s/files/1/0640/5662/3350/files/rak3.jpg?v=1655810923"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            : Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  'クレジットカード決済',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'クレジットカードをご利用いただけます。',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Image.network(
                                    width: 100,
                                    "https://cdn.shopify.com/s/files/1/0640/5662/3350/files/visa-p.jpg?v=1655810204"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Text(
                                '仮想通貨送金',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '仮想通貨（リップル）をご利用いただけます。',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Image.network(
                                  width: 100,
                                  "https://cdn.shopify.com/s/files/1/0640/5662/3350/files/ripple-3.jpg?v=1655810795"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Text(
                                '銀行口座振込',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '銀行振込をご利用いただけます。',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              Image.network(
                                  width: 100,
                                  "https://cdn.shopify.com/s/files/1/0640/5662/3350/files/rak3.jpg?v=1655810923"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: const Text(
            textAlign: TextAlign.center,
            "詳しく見る",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
