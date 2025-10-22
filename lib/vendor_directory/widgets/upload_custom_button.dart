import 'package:eshop/presentation/components/custom_circular_bar.dart';
import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final double width;
  final VoidCallback onTap;

  final Widget txt;



  const CustomButton2({
    super.key,
    required this.width,
    required this.onTap,
    required this.txt,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 56,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFDB3022),
        ),
        child: txt,

      ),
    );
  }
}
