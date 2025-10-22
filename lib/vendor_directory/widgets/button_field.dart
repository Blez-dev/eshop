import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonField extends StatefulWidget {
   ButtonField({super.key,required this.title,this.pickedOption});
  final String title;
  final String? pickedOption;



  @override
  State<ButtonField> createState() => _ButtonFieldState();
}

class _ButtonFieldState extends State<ButtonField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Row(
        children: [
          Row(
            children: [
              Text(widget.title, style: TextStyle(color: const Color(0xff8391A1), fontSize: 20)),
              SizedBox(width: 5,),
              Text(widget.pickedOption?? "", style: TextStyle(color:  Color(0xff45515F), fontSize: 20)),
            ],
          ),
          Spacer(),
          Icon(Icons.navigate_next_outlined,color: const Color(0xff8391A1),),
        ],
      ),),
    );
  }
}
