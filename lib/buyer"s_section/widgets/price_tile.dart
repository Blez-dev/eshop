import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceTile extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  const PriceTile({super.key,required this.child,required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Color(0xffE8ECF4),
        borderRadius: BorderRadius.circular(5.r),
        border: BoxBorder.all(
          color: borderColor,
          width: 1.5.w
        )
      ),
      child: Center(child: child),
    );
  }
}
