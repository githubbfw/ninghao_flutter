import 'dart:collection';

import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: <Widget>[
          IconBadge(Icons.pool,size: 60,),
          //一个可以设置宽高比的控件
         AspectRatio(
           aspectRatio: 16/9,
           child: Container(
             color: Color.fromRGBO(3, 54, 255, 1),
           ),
         ),
         //另外一个可以控制宽高的控件
         ConstrainedBox(
           constraints: BoxConstraints(
             maxWidth: 200,
             minHeight: 200
           ),
            child: Container(
             color: Colors.red
           ),

         )

        ],
      )
    );
  }
}


class IconBadge extends StatelessWidget {
   
   final IconData  icon;
   final double size ;

   IconBadge(this.icon, {
     this.size = 32 
     }) ;


  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Icon(icon,size: size,color: Colors.white,),
      width: size +60,
      height: size+60,
      color: Color.fromRGBO(3, 54, 255, 1)
    );
  }
}


