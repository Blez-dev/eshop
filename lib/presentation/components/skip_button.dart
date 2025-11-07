import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipCustomButton extends StatelessWidget {
  final double width;
  final VoidCallback onTap;
  final String text;

  const SkipCustomButton({
    super.key,
    required this.width,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          // color: Color.fromRGBO(219, 48, 34, 0.1) // 10% opacity
          // super light
          // very, very light red
          color: Color(0xffE8ECF4),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            // color: Color.fromRGBO(219, 48, 34, 1)
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
