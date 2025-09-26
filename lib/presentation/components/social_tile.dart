import 'package:flutter/material.dart';

class SocialTile extends StatelessWidget {
  final String image;
  const SocialTile({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffE8ECF4),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Image.asset(image,height: 30,),
      ),
    );
  }
}
