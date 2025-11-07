import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {

  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.h,
      width: 41.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Color(0xFFE8ECF4),
      ),
      child: Icon(Icons.arrow_back_ios_new_outlined),
    );
  }
}
