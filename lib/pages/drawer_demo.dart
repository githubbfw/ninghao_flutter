import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            children: <Widget>[
            UserAccountsDrawerHeader(  
              accountName: Text("bifw",style: TextStyle(color: Colors.red,fontWeight:FontWeight.bold),),
              accountEmail: Text("bifw.com@gmai.com"),
              currentAccountPicture: CircleAvatar(  
                backgroundImage: AssetImage("images/logo.png")
              ),
              decoration:BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                  image: NetworkImage("https://dss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo_top-e3b63a0b1b.png"),
                  // fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.yellow[400].withOpacity(0.6),BlendMode.hardLight)

                ),
              ),
              
            ),

              // DrawerHeader(
              //   child: Text("header".toUpperCase()),
              //   decoration: BoxDecoration(color: Colors.grey[200]),
              // ),
              ListTile(
                title: Text(
                  "Message",
                  textAlign: TextAlign.right,
                ),
                trailing: Icon(
                  Icons.message,
                  color: Colors.black12,
                  size: 22,
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                     Navigator.pop(context);
                  // showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return new AlertDialog(
                  //         title: Text(
                  //           "ListViewDemo",
                  //           style: new TextStyle(
                  //             color: Colors.black54,
                  //             fontSize: 18.0,
                  //           ),
                  //         ),
                  //         content: Text("safdasf"),
                  //       );
                  //     });
                },
                title: Text(
                  "Favorite",
                  textAlign: TextAlign.right,
                ),
                trailing: Icon(
                  Icons.favorite,
                  color: Colors.black12,
                  size: 22,
                ),
              ),
              ListTile(
                title: Text(
                  "Settings",
                  textAlign: TextAlign.right,
                ),
                trailing: Icon(
                  Icons.settings,
                  color: Colors.black12,
                  size: 22,
                ),
              ),
            ],
          ),
        );
  }
}