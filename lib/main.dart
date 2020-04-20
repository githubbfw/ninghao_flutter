
import 'package:flutter/material.dart';
import 'package:ninghao_flutter/pages/animation/animation_demo.dart';
import 'package:ninghao_flutter/pages/basic_demo.dart';
import 'package:ninghao_flutter/pages/form_demo.dart';
import 'package:ninghao_flutter/pages/sliver_demo.dart';
// import 'model/post.dart';
import 'pages/listview_demo.dart';
import "pages/drawer_demo.dart";
import 'pages/bottomnavigationbardemo.dart';
import 'pages/bottomnavigationbardemo.dart';
import 'pages/boxdecoration.dart';
import 'pages/layout_demo.dart';
import 'pages/view_demo.dart';
import 'pages/routes_demo.dart';
import 'pages/form_demo.dart';
 import 'pages/button_demo.dart';
 import 'pages/bottom_sheetDemo.dart';
 import 'pages/expansion_panel_demo.dart';
 import 'pages/chip_demo.dart';
 import 'pages/state_manager_demo.dart';

 import 'pages/rxdart/rxdart_demo.dart';
  import 'pages/http/http_demo.dart';
  import 'pages/expansion_panel_demo.dart';
  import 'pages/animation/animation_demo2.dart';



void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      //这个是sliver 视图的学习布局
      // home: Sliver_Demo(),

       //这个是学习路由，routes 
      //  initialRoute: "/",

   
       //这个地方，我们添加一个form表单的学习
      //  initialRoute: "/",
        // initialRoute: "/form",
//        initialRoute:  "/button",
//         initialRoute: "/bottom_sheet",
          // initialRoute: "/expansion_panel_demo",    
            // initialRoute: "/chip_demo",
            // initialRoute: "/statemanager_model_demo",

        //  initialRoute: "/rxdart",    
        //  initialRoute: "/http",  
        //  initialRoute: "/animation",  
         initialRoute: "/animation2",  

      //initialRoute: "/", 这句话，是跟home是有抵触的，所有在使用的时候，不能同时使用。
      //  home:  RoutesDemo(),
       routes: {
       
         //一进去就是表单界面
        // "/form": (context)=> FormDemo(),

        //按钮button的学习
//        "/button":(context) => ButtonDemo()

         //bottomsheet的学习
////         "/bottom_sheet":(context) =>BottomSheetDemo(),

         //expansion_panel的学习
        //  "/expansion_panel_demo":(context) =>Expansion_Pane(),

        //chip小碎片的学习
        // "/chip_demo":(context)=>ChipDemo(),
        // "/statemanager_model_demo":(context)=>StateManageDemo(),

        //rxdart的学习
        "/rxdart":(context)=>RxDartDemo(),
        "/http":(context)=>HttpDemo(),

        //  "/animation":(context)=>AnimationDemo(),

     "/animation2":(context)=>AnimationDemo2(),


        //  "/":  (context)=> Page(title: "AAAAA",),
        //  "/about":( context)=>Page(title: "AAAAA",)
        
       },
       
       //这个是前几章的主要home（）
      // home: Home(),
      theme: ThemeData(
          primarySwatch: Colors.yellow, 
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //点击高亮的颜色
          splashColor: Colors.white70, //水波纹的颜色
          accentColor: Color.fromRGBO(3, 54, 255, 1)
          ),
    );
  }
}

class Home extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 4,
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
              Tab(icon: Icon(Icons.directions_bike)),
                 Tab(icon: Icon(Icons.view_quilt))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Basic_Demo(),
            // listview_demo(),
            // Icon(Icons.local_florist,size: 120,color: Colors.black12,),
            BoxDecoration_Demo(),
            LayoutDemo(),
            // Icon(Icons.change_history, size: 120,color: Colors.black12,),
            // Icon(Icons.directions_bike,size: 120, color: Colors.black12,)
            View_Demo()
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
