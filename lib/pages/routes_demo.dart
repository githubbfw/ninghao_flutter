import 'package:flutter/material.dart';

class RoutesDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child: Row(
          children: <Widget>[
            FlatButton(
              child: Text("home"),
              onPressed: (){

              },
            ),
                FlatButton(
              child: Text("About"),
              onPressed: (){

                //跳转的第一种方式
                // Navigator.of(context).push(
                //    MaterialPageRoute(
                //      builder: (BuildContext context){
                //           return Page(title: "About",);
                //      }
                //    )
                // );


                //第二种跳转方式
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}


class Page extends StatelessWidget {
  
  final String title;

  const Page({this.title});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}
