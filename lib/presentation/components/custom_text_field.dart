import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Widget? icon;
  final TextEditingController controller;
  final bool obscureText;
  final int? inputLength;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
      this.inputLength,
    required this.obscureText,
    this.icon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {


  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.inputLength?? 35),
      ],
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14.sp,color: Colors.black),
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.icon,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: const Color(0xff8391A1),
        ),
        filled: true,
        fillColor: const Color(0xffF7F8F9), // background color
        contentPadding:
     EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide:  BorderSide(
            color: Colors.grey, // border color
            width: 1.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide:  BorderSide(
            color: Colors.grey,
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide:  BorderSide(
            color: Colors.red, // border color when focused
            width: 1.w,
          ),
        ),
      ),
    );
  }
}
