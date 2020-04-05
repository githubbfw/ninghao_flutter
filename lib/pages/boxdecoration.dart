import 'package:flutter/material.dart';

class BoxDecoration_Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //给container  添加一个背景图片，
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://dss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo_top-e3b63a0b1b.png"),
              alignment: Alignment.topCenter,
              // repeat: ImageRepeat.repeatX
              fit: BoxFit.cover,
              //滤镜模式
              colorFilter: ColorFilter.mode(
                  Colors.indigoAccent[400].withOpacity(0.5),
                  BlendMode.hardLight))),
      child: Row(
        children: <Widget>[
          Container(
            height: 90.0,
            width: 80.0,
            // color: Colors.red,
            decoration: BoxDecoration(
              // border: Border.all(

              // )
              // border:  Border(
              //   top:  BorderSide(
              //     color: Colors.black26,
              //     width: 3.0
              //   ),
              //   left: BorderSide(

              //   )
              // )

              //阴影效果
              boxShadow: [
                BoxShadow(
                    offset: Offset(20, 30),
                    color: Colors.red,
                    blurRadius: 2.0, //阴影模糊程度，值约到，模糊的越明显
                    spreadRadius: 1.0 // 阴影模糊扩散程度，正值，扩大阴影面积，，负数  缩小阴影面积。

                    )
              ],
              //形状
              shape: BoxShape.circle, //圆形，
              // gradient: RadialGradient(
              //   colors: [

              //   ]
              // ),

              //  gradient: LinearGradient(

              //  )
            ),
          )
        ],
      ),
    );
  }
}
