import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_task1/bloc/home/home_bloc.dart';
import 'package:web_task1/view/home/home_screen.dart';

import 'bloc/floating_button/floating_button_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
//need to set url strategy for web
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FloatingButtonBloc(),
        ),
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Hayaland',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: const HomeScreen(),
      ),
    );
  }
}
