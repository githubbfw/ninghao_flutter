import 'package:flutter/material.dart';

class PopuMenuDemo extends StatefulWidget {
  @override
  _PopuMenuDemoState createState() => _PopuMenuDemoState();
}

class _PopuMenuDemoState extends State<PopuMenuDemo> {

String  popumenuText = "home";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopuMenuDemo"),
        elevation: 0,
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:  CrossAxisAlignment.end,
          children: <Widget>[
            
            Text(popumenuText),
              PopupMenuButton(
                onSelected: (value){
                  print(value);
         setState(() {
            popumenuText =value; 
         });
                     
                },
                itemBuilder: (BuildContext context)=>[  //这个写法还只能这么写，不用用{}在嵌套一层
                     PopupMenuItem(
                          value:  "home",
                          child: Text("home"),
                        ),
                          PopupMenuItem(
                          value:  "discover",
                          child: Text("discover"),
                        ),
                          PopupMenuItem(
                          value:  "social",
                          child: Text("social"),
                        ),
                ],
              )

          ],
        ),
      ),
    );
  }
}