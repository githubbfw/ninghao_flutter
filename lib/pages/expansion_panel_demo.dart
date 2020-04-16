import 'package:flutter/material.dart';


class Expansion_Pane extends StatefulWidget {
  @override
  _Expansion_PaneState createState() => _Expansion_PaneState();
}

class _Expansion_PaneState extends State<Expansion_Pane> {

  List<ExpansionPanelItem> expansionpanelitemList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    expansionpanelitemList = <ExpansionPanelItem>[
      ExpansionPanelItem(
          headerText: "Panne A",
          body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Text("content ofr pane a"),
          ),
          isExp: false
      ),
      ExpansionPanelItem(
          headerText: "Panne B",
          body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Text("content ofr pane b"),
          ),
          isExp: false
      ),
      ExpansionPanelItem(
          headerText: "Panne C",
          body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Text("content ofr pane c"),
          ),
          isExp: false
      ),

    ];


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text( "expansionpanelDemo"),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            ExpansionPanelList(
              expansionCallback: (int expansionIndex,bool expbool){
                setState(() {
                  expansionpanelitemList[expansionIndex].isExp = ! expbool;
                });

              },
              children: expansionpanelitemList.map((ExpansionPanelItem item){
                return ExpansionPanel(
                    isExpanded: item.isExp,
                    headerBuilder: (BuildContext context, bool isExpanded){
                      return  Container(
                        padding: EdgeInsets.all(2),
                        child: Text(item.headerText,
                            style: Theme.of(context).textTheme.title),
                      );
                    },
                    body: item.body
                );
              }).toList(),
            )

          ],
        ),
      ),
    );
  }
}
//定义一个收缩面板的类
class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExp;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExp,
  });
}
