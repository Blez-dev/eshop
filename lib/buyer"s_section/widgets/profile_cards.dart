
import 'package:eshop/buyer%22s_section/widgets/icon_tile.dart';
import 'package:flutter/material.dart';

class CustomProfileChip extends StatelessWidget {
  final Widget iconTileWidget;
  final String text;
  const CustomProfileChip({super.key,required this.iconTileWidget,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
          
        ),
      child: Row(
        children: [
          IconTile(iconTileWidget: iconTileWidget),
          SizedBox(width: 15,),
          Text(text,style: TextStyle(color: Colors.black),),
          Spacer(),
          Icon(Icons.arrow_forward_ios,size: 15,)
        ],
      ),

    );
  }
}
