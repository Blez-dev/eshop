import 'package:flutter/material.dart';

class NumberContainer extends StatelessWidget {
  final Widget text;
  final String imagePath;

  const NumberContainer({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 110,
      decoration: BoxDecoration(
        color: const Color(0xFFDB3022),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      alignment: Alignment.center,
      child: Row(

          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(imagePath,height: 40,width: 40,),
            ),

            Expanded(child: text)

          ]

      ),
    );
  }
}
