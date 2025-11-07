import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonField extends StatefulWidget {
  ButtonField({super.key, required this.title, this.pickedOption});

  final String title;
  final String? pickedOption;

  @override
  State<ButtonField> createState() => _ButtonFieldState();
}

class _ButtonFieldState extends State<ButtonField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.grey, width: 1.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: Color(0xff8391A1),
                        fontSize: 20.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Flexible(
                    child: Text(
                      widget.pickedOption ?? "",
                      style: TextStyle(
                        color: Color(0xff45515F),
                        fontSize: 20.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Icons.navigate_next_outlined,
              color: Color(0xff8391A1),
            ),
          ],
        ),
      ),
    );
  }
}
