import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomOutlinedButton2 extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback onTap;


  const CustomOutlinedButton2({
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
        height: 50,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFDB3022), width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.whatsapp,color: Color(0xFFDB3022),),
            SizedBox(width: 10,),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Color(0xFFDB3022)
              ),
            ),
          ],
        )
      ),
    );
  }
}
