import 'package:flutter/material.dart';

class CustomCircularBar extends StatelessWidget {
  const CustomCircularBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
