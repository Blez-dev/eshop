import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconTile extends StatelessWidget {
  final Widget iconTileWidget;
  const IconTile({super.key,required this.iconTileWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: Color(0xfff9fafb),
        borderRadius: BorderRadius.all(Radius.circular(13.r)),
      ),
      child: iconTileWidget,
    );
  }
}
