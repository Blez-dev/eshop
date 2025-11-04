import 'package:eshop/presentation/components/custom_circular_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButton3 extends StatelessWidget {
  final double width;
  final VoidCallback onTap;
  final String text;


  const CustomButton3({
    super.key,
    required this.width,
    required this.text,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTap,
      child: Container(
        height: 50,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFDB3022),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.phone,color: Colors.white,size: 18,),
            SizedBox(width: 10,),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white
              ),
            ),
          ],
        )
      ),
    );
  }
}
