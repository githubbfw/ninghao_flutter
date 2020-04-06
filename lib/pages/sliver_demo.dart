import 'package:flutter/material.dart';

class Sliver_Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text("ninghao"),
            // pinned: true,
            floating: true,
            expandedHeight: 178,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("ninghao flutter "),
              background: Image.asset("images/logo.png",
              fit: BoxFit.cover,
              ),

            ),
          ),
        SliverSafeArea( //这个是头部的信息被挡住了，所以就这样处理一下
          sliver:   SliverPadding(
            padding: EdgeInsets.all(8), //给sliverGrid 添加一个padding值，，
            sliver: SliverGridDemo()
            ),
        )
          
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            color: Colors.red,
            width: 80,
            height: 80,
            child: Text("bifw"),
          );
        }, childCount: 100));
  }
}
