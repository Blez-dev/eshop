import 'package:flutter/cupertino.dart';

class PriceTile extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  const PriceTile({super.key,required this.child,required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xffE8ECF4),
        borderRadius: BorderRadius.circular(5),
        border: BoxBorder.all(
          color: borderColor,
          width: 1.5
        )
      ),
      child: Center(child: child),
    );
  }
}
