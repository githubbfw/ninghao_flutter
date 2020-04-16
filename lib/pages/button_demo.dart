import 'package:flutter/material.dart';
import 'popumenuemo.dart';
import 'package:intl/intl.dart'; //日期的插件

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("button_demo"),
        elevation: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          ListItem(
            title: "FloatactionbuttonDemo",
            page: Floatactionbuttondemo(),
          ),
          ListItem(
            title: "PopuMenuDemo",
            page: PopuMenuDemo(),
          ),

          // 复选框  问题
          Checkbox(
            activeColor: Colors.black,
            value: true,
            onChanged: (value) {},
          ),

          CheckboxListTile(
            value: true,
            onChanged: (value) {},

            title: Text("checkbox item A"),
            subtitle: Text("describe"),
            secondary: Icon(Icons.bookmark),
            //添加一个图标
            selected: true, //激活状态
          ),

          //  Radio  RadioListTile
          // Switch

          //滑块； slide
          SliderDemo(),
          Date_Demo(),
          SizedBox(
            height: 30.0,
          ),

          Time_Demo(),
          //dialog
          Dialog_Demo(),

          AlterDialog_Demo(),




        ],
      ),
    );
  }
}

enum Option { A, B, C }

//alterDialog
class AlterDialog_Demo extends StatefulWidget {
  @override
  _AlterDialog_DemoState createState() => _AlterDialog_DemoState();
}

class _AlterDialog_DemoState extends State<AlterDialog_Demo> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text("AlterDailgo_Demo "),
      onPressed: () {
        showDialog(
            barrierDismissible: false, //点击空白地方，也不会消失。
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("AlerDialog "),
                content: Text("are you suer about this?"),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("cancel")),
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("ok"))
                ],
              );
            });
      },
    );
  }
}

//simpledialog

class Dialog_Demo extends StatefulWidget {
  @override
  _Dialog_DemoState createState() => _Dialog_DemoState();
}

class _Dialog_DemoState extends State<Dialog_Demo> {
  String _choice = "Nothing";

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () async {
          final option = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: Text("bifw"),
                  children: <Widget>[
                    SimpleDialogOption(
                      child: Text("aaaa"),
                      onPressed: () => Navigator.pop(context, Option.A),
                    ),
                    SimpleDialogOption(
                      child: Text("aaaa"),
                      onPressed: () => Navigator.pop(context, Option.B),
                    ),
                    SimpleDialogOption(
                      child: Text("aaaa"),
                      onPressed: () => Navigator.pop(context, Option.C),
                    ),
                  ],
                );
              });

          switch (option) {
            case Option.A:
              print("A");
              break;
            case Option.B:
              print("B");
              break;
            case Option.C:
              print("C");
              break;
          }
        },
        child: Text("Button"));
  }
}

//时间选择器
class Time_Demo extends StatefulWidget {
  @override
  _Time_DemoState createState() => _Time_DemoState();
}

class _Time_DemoState extends State<Time_Demo> {
  DateTime dateTime = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  Future<void> _selectedTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (time == null) {
      return;
    }

    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _selectedTime,
        child: Text(selectedTime.format(context)),
      ),
    );
  }
}

//日期：
class Date_Demo extends StatefulWidget {
  @override
  _Date_DemoState createState() => _Date_DemoState();
}

class _Date_DemoState extends State<Date_Demo> {
//首先初始化，一个当前的日期值。

  DateTime selectDate = DateTime.now();

//不知道为什么这个地方，需要加 asyn   awit
  Future<void> _selectDate() async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    setState(() {
      selectDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _selectDate,
        child: Text(DateFormat.yMd().format(selectDate)),
      ),
    );
  }
}

//滑块slider

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Slider(
            value: sliderValue,
            onChanged: (value) {
              print(value);
              setState(() {
                sliderValue = value;
              });
            },
            min: 0,
            max: 10,
            //分割成10份，label 是显示 每一个发值
            divisions: 10,
            label: '$sliderValue',
            activeColor: Theme.of(context).accentColor,
            inactiveColor: Theme.of(context).backgroundColor,
          ),

          Text(
            "slider value ${sliderValue}",
            style: TextStyle(color: Colors.red),
          )
          //显示slide的值
        ],
      ),
    );
  }
}

class Floatactionbuttondemo extends StatelessWidget {
  final Widget floatingactionbutton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 100,
    backgroundColor: Colors.black,
    //  shape: BeveledRectangleBorder(
    //    borderRadius: BorderRadius.circular(40)
    //  ),
  );

  final Widget floatingactionextended = FloatingActionButton.extended(
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text("Add"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatactionbuttonDemo"),
        elevation: 0,
      ),
      floatingActionButton: floatingactionbutton,
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // 这个是floatingactionbutton的位置
      // 这个是另外一个floatingactionbutton的带水波纹的效果的
      // floatingActionButton:  floatingactionextended,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          child: FlatButton(
            child: Text("Button"),
            onPressed: () {}, //如果这个地方设置为空，这个按钮就是灰色的
            splashColor: Colors.green, //点击button的波纹效果颜色，
            textColor: Theme.of(context).accentColor,
          ),
        ),
        //这个是把bottombar 切成和 flaotingactionbutton,一样的吻合的切口。
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  const ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
