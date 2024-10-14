import 'package:arduino_code/home.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Map<String, WidgetBuilder> get routes => {'/home': (_) => const Home()};
}
