import 'package:flutter/material.dart';
class AnimationDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('animation demo'),
       ),
       body: AnimationHome(),
    );
  }
}


class AnimationHome extends StatefulWidget {
  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome> with TickerProviderStateMixin {

AnimationController animationController;

Animation animation;
Animation animationColors;

//带有曲线的动画
CurvedAnimation curvedAnimation; 




@override
void initState() { 
  super.initState();
  animationController = AnimationController(
    //这个3个值用tween进行设置了
    // value: 10,
    // lowerBound: 10,
    // upperBound: 100,
    duration: Duration(milliseconds: 3000),
    vsync: this,

  );

    //以前都是这个去监听 动画值的变化 
  //  animationController.addListener((){
  //   //  print(animationController.value);

  //   //这个地方是更新value的值
  //    setState(() {
       
  //    });

  //  });


   animationController.addStatusListener((AnimationStatus status){
     print(animationController.status);

   });

    //开始播放器
    // animationController.forward();


    curvedAnimation = CurvedAnimation(parent: animationController,curve: Curves.bounceInOut);

    animation  = Tween(begin: 10.0,end: 100.0).animate(curvedAnimation);

    animationColors= ColorTween(begin: Colors.red,end: Colors.yellow).animate(curvedAnimation);


    
    //使用tween 这个是展示动画

  animation  = Tween(begin: 10.0,end: 100.0).animate(animationController);

  animationColors= ColorTween(begin: Colors.red,end: Colors.yellow).animate(animationController);



}

@override
void dispose() { 
  super.dispose();
  animationController.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimationHeart(
        animations: [
          animation,
          animationColors
        ],
        animationController: animationController,
      ),
      
    );
  }
}



//以前都是用addListern去监听 动画值的变化  现在可以直接继承 animationwidget 这个类

class AnimationHeart extends AnimatedWidget{

final List animations;
final AnimationController animationController;

  AnimationHeart({this.animations, this.animationController}):super(listenable:animationController);





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
       onPressed: (){
         switch (animationController.status) {
             case AnimationStatus.completed:
                 animationController.reverse();
               
               break;
             default:
               animationController.forward();
           }
       },
    );
  }
  
}