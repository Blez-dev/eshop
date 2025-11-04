import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoDetailsPage extends StatelessWidget {
  final Widget childWidget;
  const InfoDetailsPage({super.key,required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: childWidget),
    );
  }
}
