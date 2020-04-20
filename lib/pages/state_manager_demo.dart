
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManageDemo extends StatefulWidget {
  @override
  _StateManageDemoState createState() => _StateManageDemoState();
}

class _StateManageDemoState extends State<StateManageDemo> {
  int count = 0;

  void addCounter() {
    setState(() {
      count += 1;
      print("${count}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProver(
      count: count,
      increateCount: addCounter,
      child:   Scaffold(
        appBar: AppBar(
          title: Text("state manage"),
          elevation: 0,
        ),
        body: Container(child: CounterWrappter()),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),

          //  onPressed:addCounter,
          onPressed: () {
            addCounter();
          },
        )),
    );
  
  }
}

class CounterWrappter extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return CounterDemo();
  }
}




class CounterDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      final int count = CounterProver.of(context).count;
     final VoidCallback increaseCount =CounterProver.of(context).increateCount; //注意这个VoidCallback 不是其他dart文件里面的
    return Center(
      child: ActionChip(
          label: Text("$count"),
          onPressed: () {
            increaseCount();
          }),
    );
  }
}


class CounterProver extends InheritedWidget {
 
  final int count;
  final VoidCallback  increateCount;
  final Widget child;

  CounterProver({this.count,this.increateCount, key, this.child}) : super(key: key, child: child);



  static CounterProver of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProver)as CounterProver);
  }

  @override
  bool updateShouldNotify( CounterProver oldWidget) {
    return true;
  }
}


// class StateManageDemo extends StatelessWidget {

//  final int count =0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("state manage"),
//         elevation: 0,
//       ),
//       body: Container(
//         child: Center(
//           child: Text("${count}"),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: (){
//            count +=1;
//         },
//       ),
//     );
//   }
// }
