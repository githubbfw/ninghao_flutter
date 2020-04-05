
import 'package:flutter/material.dart';
import 'package:ninghao_flutter/pages/basic_demo.dart';
// import 'model/post.dart';
import 'pages/listview_demo.dart';
import "pages/drawer_demo.dart";
import 'pages/bottomnavigationbardemo.dart';
import 'pages/bottomnavigationbardemo.dart';
import 'pages/boxdecoration.dart';
import 'pages/layout_demo.dart';



void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //点击高亮的颜色
          splashColor: Colors.white70 //水波纹的颜色
          ),
    );
  }
}

class Home extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: "menu",
          //   onPressed: () => {
          //     debugPrint("菜单按钮"),
          //   },
          // ),
          title: Text("ninghao1111"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: "搜索按钮",
              onPressed: () => debugPrint("搜索按钮"),
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: "搜索按钮",
              onPressed: () => debugPrint("搜索按钮"),
            )
          ],
          elevation: 0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Basic_Demo(),
            // listview_demo(),
            // Icon(Icons.local_florist,size: 120,color: Colors.black12,),
            BoxDecoration_Demo(),
            LayoutDemo()
            // Icon(Icons.change_history, size: 120,color: Colors.black12,),
            // Icon(Icons.directions_bike,size: 120, color: Colors.black12,)
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo()
      ),
    );
  }
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "2222222222",
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.yellow),
      ),
    );
  }
}
