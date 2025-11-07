import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberContainer extends StatelessWidget {
  final Widget text;
  final String imagePath;

  const NumberContainer({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 110.w,
      decoration: BoxDecoration(
        color: const Color(0xFFDB3022),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          bottomLeft: Radius.circular(30.r),
        ),
      ),
      alignment: Alignment.center,
      child: Row(

          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Image.asset(imagePath,height: 40.h,width: 40.w,),
            ),

            Expanded(child: text)

          ]

      ),
    );
  }
}
