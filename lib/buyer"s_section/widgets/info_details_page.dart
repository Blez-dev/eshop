import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoDetailsPage extends StatelessWidget {
  final Widget childWidget;
  const InfoDetailsPage({super.key,required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: childWidget),
    );
  }
}
