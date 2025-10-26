import 'package:flutter/cupertino.dart';

class BrandTile extends StatelessWidget {
  final Widget child;
  const BrandTile({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      decoration: BoxDecoration(
          color: Color(0xffE8ECF4),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Center(child: child),
    );
  }
}
