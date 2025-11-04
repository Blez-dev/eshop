import 'package:eshop/presentation/components/custom_circular_bar.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final VoidCallback onTap;
  final String text;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.width,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap, // disable while loading
      child: Container(
        height: 50,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFDB3022),
        ),
        child: isLoading
            ?  CustomCircularBar()
            : Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
