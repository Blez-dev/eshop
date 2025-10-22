import 'package:flutter/material.dart';

class CustomCircularBar2 extends StatelessWidget {
  const CustomCircularBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      child: Center(
        child: CircularProgressIndicator(
          color: Color(0xFFDB3022),
        ),
      ),
    );
  }
}
