import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkipCustomButton extends StatelessWidget {
  final double width;
  final VoidCallback onTap;
  final String text;
  const SkipCustomButton({super.key,required this.width,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 14,color: Colors.green),
        ),
      ),
    );
  }
}
