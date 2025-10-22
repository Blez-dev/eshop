import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final Widget imageWidget;
  const ImageContainer({super.key,required this.imageWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: imageWidget,
    );
  }
}
