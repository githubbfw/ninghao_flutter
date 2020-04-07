import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        //仅仅是改变当前界面的主题颜色
        data: Theme.of(context).copyWith(primaryColor: Colors.black),
        // data:  ThemeData(
        //   primaryColor: Colors.black
        // ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //  TextFieldDemo(),
              //添加一个注册信息表单
              RegisterFormDemo()
            ],
          ),
        ),
      ),
    );
  }
}

//注册表单信息，
class RegisterFormDemo extends StatefulWidget {
  @override
  _RegisterFormDemoState createState() => _RegisterFormDemoState();
}

class _RegisterFormDemoState extends State<RegisterFormDemo> {
  final registerFormKey = GlobalKey<FormState>();
  

  String username, password;
  
  //根据当前情况，去判断 是否要自动提示
  bool  autoValidate = false;

  void registerButtom() {
    //先用这个控件的 去保存，输入的内容
        //这个要添加验证的判断true  false
   
    if ( registerFormKey.currentState.validate()) { //验证通过，
        registerFormKey.currentState.save();

    //打印输入的内容
    debugPrint("username-----${username}");
    debugPrint("password-----${password}");

  //验证成功，给一个snackbar 
    
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Registering....."),
      )
    );




      
    } else { //验证未通过，
      
      //这里一定要用一下Setstate 去更新状态
        setState(() {
          autoValidate = true; 
        });
    
    }

  
  }

  //验证输入的内容，不正取就就给出信息
  String validateusername(value) {

    if (value.isEmpty) {//判断值是不是为空，这个地方isempty是不会给出代码提示的
        return " username is requied";
    } else {
      return null;
    }

  }


 //验证输入的内容，不正取就就给出信息
  String validatepassword(value) {

    if (value.isEmpty) {//判断值是不是为空，这个地方isempty是不会给出代码提示的
        return " password is requied";
    } else {
      return null;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            //验证输入的内容，不正确就给出提示
            validator: validateusername,
            autovalidate: autoValidate,
            onSaved: (value) {
              username = value;
            },
            decoration: InputDecoration(
              labelText: "username",
              helperText: ""  //这个好像也没有什么作用
              ),
          ),
          SizedBox(
            height: 32,
          ),
          TextFormField(
            autovalidate: autoValidate,
            obscureText: true, //是否是加密状态
            onSaved: (value) {
              password = value;
            },
            //验证输入的内容，不正确就给出提示
            validator: validatepassword,
            decoration: InputDecoration(labelText: "password",
             helperText: "" , //这个好像也没有什么作用
             ) 
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            width: double.infinity, //无穷大
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0,
              onPressed: registerButtom,
            ),
          )
        ],
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //这个primaryColor  的颜色，是用到前面这个主题的颜色
      color: Theme.of(context).accentColor,
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
//添加一个文本控制器

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //初始化，文本框的输入值
    //  textEditingController.text = "bifw";
    textEditingController.addListener(() {
      debugPrint("input ${textEditingController.text}");
    });
  }

// @override
//   void setState(fn) {
//     // TODO: implement setState
//     super.setState(fn);
//        textEditingController.addListener(
//            (){
//              debugPrint("input ${textEditingController.text}");
//            }
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: textEditingController,
        // onChanged: (value){
        //   debugPrint("输入的尼尔》》》${value}");
        // },
        onSubmitted: (value) {
          debugPrint("onSubmitted${value}");
        },
        decoration: InputDecoration(
            icon: Icon(Icons.subject),
            labelText: "Title",
            hintText: "jdlajdf",
            // border: InputBorder.none //没有输入框的下划线
            border: OutlineInputBorder(), //这个输入框的四周都有边框线
            filled: true //让输入框的空间，有阴影效果
            ),
      ),
    );
  }
}
