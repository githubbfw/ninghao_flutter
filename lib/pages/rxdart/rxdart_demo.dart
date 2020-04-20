import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';


class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RxDart"),
      ),
      body: RxdartHome(),
    );
  }
}



class RxdartHome extends StatefulWidget {
  @override
  _RxdartHomeState createState() => _RxdartHomeState();
}

class _RxdartHomeState extends State<RxdartHome> {

   @override
   void initState() { 
     super.initState();
     
    Observable<String> _observable =
     
     //
    //  Observable(Stream.fromIterable(["helle","你好"]));
       Observable.fromFuture(Future.value("hello?"));
       Observable.fromIterable(["helle","你好"]);

       Observable.just("hello");
     
     _observable.listen(print);


   }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("111111"),
    );
  }
}