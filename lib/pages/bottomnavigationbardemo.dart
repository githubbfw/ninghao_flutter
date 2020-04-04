import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  _BottomNavigationBarDemoState createState() => _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {

  int _currentIndex = 0;
  
  void _onTapHandler(int index){
    setState(() {
     _currentIndex = index; 
    });
    
  }



  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          currentIndex:  _currentIndex,
          onTap:  _onTapHandler,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_florist),
             title: Text("local")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.change_history),
             title: Text("change_history")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.change_history),
             title: Text("change_history")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.change_history),
             title: Text("change_history")
            ),
          ],

        );
  }
}