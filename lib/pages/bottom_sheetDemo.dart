import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  //动态控制收缩面板的收缩值
  bool isExpanded = false;

  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState
        .showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(
                width: 16.0,
              ),
              Text('01:30 / 03:30'),
              Expanded(
                child: Text(
                  '从头再来-刘欢',
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Future _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('拍照', textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, '拍照');
                  },
                ),
                ListTile(
                  title: Text('从相册选择', textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, '从相册选择');
                  },
                ),
                ListTile(
                  title: Text('取消', textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.pop(context, '取消');
                  },
                ),
              ],
            ),
          );
        });

    print(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  FlatButton(
//                    child: Text('Open BottomSheet'),
//                    onPressed: _openBottomSheet,
//                  ),
//                  FlatButton(
//                    child: Text('Modal BottomSheet'),
//                    onPressed: _openModalBottomSheet,
//                  ),

                  SnackbarDemo(),

                  //收缩面板， 这个必须放在一个list里面
//                  ExpansionPanelList(
//                    expansionCallback: (int expansionIndex, bool expand) {
//                      setState(() {
//                        isExpanded = !expand;
//                      });
//                    },
//                    children: [
//                      ExpansionPanel(
//                          headerBuilder:
//                              (BuildContext context, bool isExpanded) {
//                            return Container(
//                              padding: EdgeInsets.all(16),
//                              child: Text("Panne A",
//                                  style: Theme.of(context).textTheme.title),
//                            );
//                          },
//                          body: Container(
//                            padding: EdgeInsets.all(16),
//                            width: double.infinity,
//                            child: Text("content ofr pane a"),
//                          ),
//                          isExpanded: isExpanded),
//                    ],
//                  ),
//                自定义收缩面板；
                  CustomerExpander_Demo(),

                  //snackbar
                ]),
          ],
        ),
      ),
    );
  }
}

class CustomerExpander_Demo extends StatefulWidget {
  @override
  _CustomerExpander_DemoState createState() => _CustomerExpander_DemoState();
}

class _CustomerExpander_DemoState extends State<CustomerExpander_Demo> {
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
//      ExpansionPanelItem(
//          headerText: "Panne C",
//          body: Container(
//            padding: EdgeInsets.all(16),
//            width: double.infinity,
//            child: Text("content ofr pane c"),
//          ),
//          isExp: false
//      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Divider(
            height: 1,
          ),
//          Text("bsffs"),
          ExpansionPanelList(
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

class SnackbarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("processing....."),
              action: SnackBarAction(
                label: "ok",
                onPressed: () {},
              ),
            ),
          );
        },
        child: Text("open snackbar"));
  }
}
