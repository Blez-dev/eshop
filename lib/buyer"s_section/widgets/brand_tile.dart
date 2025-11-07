import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 80.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 4.h),
      decoration: BoxDecoration(
          color: Color(0xffE8ECF4),
          borderRadius: BorderRadius.circular(5.r),
        border: BoxBorder.all(
          width: 1.5.w,
          color: borderWidthColor,
        )
      ),
      child: Center(child: child),
    );
  }
}
