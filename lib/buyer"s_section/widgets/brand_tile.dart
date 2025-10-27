import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandTile extends StatelessWidget {
  final Widget child;
  final Color borderWidthColor;
  BrandTile({
  super.key,
  required this.child,
  required this.borderWidthColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      decoration: BoxDecoration(
          color: Color(0xffE8ECF4),
          borderRadius: BorderRadius.circular(5),
        border: BoxBorder.all(
          width: 1.5,
          color: borderWidthColor,
        )
      ),
      child: Center(child: child),
    );
  }
}
