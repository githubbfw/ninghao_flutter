import 'package:flutter/material.dart';
import '../model/post.dart';

class listview_demo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
          itemCount: post.length,
          itemBuilder: (BuildContext context,int index){
             return Text(post[index].title)    ;  
          },
        );
  }
}