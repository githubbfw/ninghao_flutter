import 'package:flutter/material.dart';

// 这个例子，是配置flutter应用的国际化
class Il8nDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


 Locale locale  =  Localizations.localeOf(context);

    return Scaffold(
       appBar: AppBar(
         title: Text('animation demo'),
       ),
       body: Text("${locale.toString()}"),
    );
  }
}