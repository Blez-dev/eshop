import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularBar2 extends StatelessWidget {
  const CustomCircularBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 30.w,
      child: Center(
        child: CircularProgressIndicator(
          color: Color(0xFFDB3022),
        ),
      ),
    );
  }
}
