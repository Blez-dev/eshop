import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback onTap;


  const CustomOutlinedButton({
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
        height: 56,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFDB3022), width: 2),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Color(0xFFDB3022)
          ),
        ),
      ),
    );
  }
}
