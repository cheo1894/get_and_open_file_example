import 'package:arduino_code/home.dart';
import 'package:arduino_code/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arduino Code',
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      routes: AppRoutes().routes,
      initialRoute: '/home',
      //home: Home(),
    );
  }
}
