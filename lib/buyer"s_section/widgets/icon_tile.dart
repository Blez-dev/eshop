import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  final Widget iconTileWidget;
  const IconTile({super.key,required this.iconTileWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Color(0xfff9fafb),
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: iconTileWidget,
    );
  }
}
