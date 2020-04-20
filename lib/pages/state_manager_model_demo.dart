import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("state manage"),
            elevation: 0,
          ),
          body: Container(child: CounterWrappter()),
          floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context, _, model) => FloatingActionButton(
              child: Icon(Icons.add),

              //  onPressed:addCounter,
              onPressed: () {
                model.increatCount();
              },
            ),
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
    return Center(
      child: ScopedModelDescendant<CounterModel>(
        builder: (context, _, model) {
          return ActionChip(
              label: Text("${model.count}"),
              onPressed: () {
                model.increatCount();
              });
        },
      ),
    );
  }
}

class CounterProver extends InheritedWidget {
  final int count;
  final VoidCallback increateCount;
  final Widget child;

  CounterProver({this.count, this.increateCount, key, this.child})
      : super(key: key, child: child);

  static CounterProver of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProver)
        as CounterProver);
  }

  @override
  bool updateShouldNotify(CounterProver oldWidget) {
    return true;
  }
}
//本章主要讲这个

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increatCount() {
    _count += 1;
    notifyListeners();
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
