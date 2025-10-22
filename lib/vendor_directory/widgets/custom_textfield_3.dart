import 'package:flutter/material.dart';

class CustomTextField3 extends StatefulWidget {
  final String hintText;
  final Widget? icon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField3({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
    this.icon,
  });

  @override
  State<CustomTextField3> createState() => _CustomTextField3State();
}

class _CustomTextField3State extends State<CustomTextField3> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 8,
      keyboardType: widget.keyboardType,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14,color: Colors.black),
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
        const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.grey, // border color
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.grey, // border color when focused
            width: 1,
          ),
        ),
      ),
    );
  }
}
