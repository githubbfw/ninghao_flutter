import 'package:flutter/material.dart';

class Basic_Demo extends StatelessWidget {

 final TextAlign _textAlign = TextAlign.center;
 final TextStyle _textStyle = TextStyle(
     fontSize:  20
 );

 final String _author ="bifw";
 final String _title ="jiangjainj ";


  @override
  Widget build(BuildContext context) {
    return  RichText(
      text:  TextSpan(
        text:  "bifw",
        style:  TextStyle(
          color:  Colors.black54
        ),
        children: [
          TextSpan(
             text:  "bifw",
        style:  TextStyle(
          color:  Colors.red
        ),
          )
        ]

      ),
    );
  }
}