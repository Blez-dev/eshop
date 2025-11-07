import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  final Widget imageWidget;
  const ImageContainer({super.key,required this.imageWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 180.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: imageWidget,
    );
  }
}
