import 'package:flutter/material.dart';

class View_Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
   child: GridViewDemo(),
    );
  }
}





//网格布局

class GridViewDemo extends StatelessWidget {

  Widget _gridItem(BuildContext context,int index){
    return Container(
      height: 50,
      width: 50,
      color: Colors.yellow,
      child: Text("bsfd"),
    );
  }



  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      itemCount: 3,
      itemBuilder: _gridItem,
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 3,
      //   crossAxisSpacing: 9.0,
      //         mainAxisSpacing: 9.0

      // ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 8,
        childAspectRatio: 8,

      ),
    );
  }
}



class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
           child: PageView(
        //这个属性是控制滑动的时候，当没有滑到一半的时候，自动弹回去，默认是有这种效果
        // pageSnapping: false,
        // reverse: true,//视图翻转
        scrollDirection: Axis.vertical,
        //滚动效果
        onPageChanged: (int currentInde)=> debugPrint(currentInde.toString()),
        controller: PageController(
          initialPage: 1, //初始化显示那个界面
          keepPage: false,//是否记住页面的index
          viewportFraction: 0.8  //改页面占领当前页面的百分比
        ),
        children: <Widget>[
          Container(
            color: Colors.brown[900],
            alignment: Alignment(0.0, 0.0),
            child: Text("one"),
          ),
            Container(
            color: Colors.red[900],
            alignment: Alignment(0.0, 0.0),
            child: Text("two"),
          ),
            Container(
            color: Colors.blue[900],
            alignment: Alignment(0.0, 0.0),
            child: Text("three"),
          ),
        ],
      ),
      
    );
  }
}