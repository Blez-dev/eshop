import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberTextField extends StatefulWidget {
  final String hintText;
  final Widget? icon;
  final TextEditingController controller;
  final bool obscureText;

  const PhoneNumberTextField({
    super.key,
    required this.hintText,
    required this.controller,

    required this.obscureText,
    this.icon,
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        //Enforce this in other Textfields
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
        ],

        keyboardType: TextInputType.phone,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(fontSize: 14.sp, color: Colors.black),
        obscureText: widget.obscureText,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.icon,
          hintText: widget.hintText,
          hintStyle: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: const Color(0xff8391A1)),
          filled: true,
          fillColor: const Color(0xffF7F8F9),
          // background color
          contentPadding:  EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 20.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            borderSide:  BorderSide(
              color: Colors.grey, // border color
              width: 1.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            borderSide:  BorderSide(color: Colors.grey, width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            borderSide: BorderSide(
              color: Colors.red, // border color when focused
              width: 1.w,
            ),
          ),
        ),
      ),
    );
  }
}
