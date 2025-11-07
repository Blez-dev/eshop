import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField2 extends StatefulWidget {
  final String hintText;
  final Widget? icon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;


  const CustomTextField2({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
    this.icon,

  });

  @override
  State<CustomTextField2> createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {


  @override
  Widget build(BuildContext context) {
    return TextField(

    inputFormatters: [

      CurrencyInputFormatter(

        leadingSymbol: "#",
        thousandSeparator: ThousandSeparator.Comma,
        mantissaLength: 0,
        useSymbolPadding: true

      ),
      LengthLimitingTextInputFormatter(11),
    ],
      keyboardType: widget.keyboardType,
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
         EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
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
            color: Colors.grey, // border color when focused
            width: 1.w,
          ),
        ),
      ),
    );
  }
}
