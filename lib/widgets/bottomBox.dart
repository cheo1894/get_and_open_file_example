import 'package:flutter/material.dart';

class BottomBox extends StatelessWidget {
  Widget? child;
   BottomBox({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: child,
    );
  }
}
