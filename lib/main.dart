import 'package:flutter/material.dart';
import 'package:web_task1/view/home/home_screen.dart';

import 'package:web_task1/view/product/product_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
//need to set url strategy for web
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/product': (context) => const ProductScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}
