import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../state_manager/sizes_notifier.dart';

class SizeTile extends ConsumerStatefulWidget {
  final String size;
  Color borderColor;
  Color textColor;
  Color backgroundColor;

  SizeTile({
    super.key,
    required this.size,
    required this.borderColor,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  ConsumerState<SizeTile> createState() => _SizeTileState();
}

class _SizeTileState extends ConsumerState<SizeTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,

      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: BoxBorder.all(width: 0.5.w,color: widget.borderColor),
      ),
      child: Center(
        child: Text(widget.size, style: TextStyle(color: widget.textColor)),
      ),
    );
  }
}
