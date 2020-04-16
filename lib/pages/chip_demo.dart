import 'package:flutter/material.dart';
import 'package:ninghao_flutter/model/post.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> tags = ["Apple", "Oriange", "Banner"];

  String _choice = "Apple";

  //datatable 的使用

  int _sortIndex =0;
  bool _sortSeleted =false;




 int _currentStep = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chip demo"),
        elevation: 0,
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:  Container(
        child: Wrap(
          //这个控件，会自动
          spacing: 10,
          children: <Widget>[
            Chip(
              label: Text("life"),
            ),
            Chip(
              backgroundColor: Colors.yellow,
              label: Text("life"),
            ),
            Chip(
              label: Text("life"),
              avatar: CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
            ),
            Chip(
              label: Text("life"),
              avatar: CircleAvatar(
                backgroundImage: AssetImage("images/logo.png"),
              ),
            ),
            Chip(
              label: Text("life"),
              avatar: CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
            ),
            Chip(
              label: Text("life"),
              avatar: CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
            ),
            Chip(
              label: Text("life"),
              avatar: CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
            ),
            Chip(
              label: Text("life"),
              avatar: CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
            ),
            Chip(
              label: Text("life"),
              onDeleted: () {},
              // deleteIcon: ,
              deleteIconColor: Colors.redAccent,
              deleteButtonTooltipMessage: "remove this tag2",
              avatar: CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
            ),
            Wrap(
              spacing: 8,
              children: tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  onDeleted: () {
                    setState(() {
                      tags.remove(tag);
                    });
                  },
                );
              }).toList(),
            ),
            ActionChip(
              label: Text("banner"),
              onPressed: () {},
            ),
            Divider(height: 1),
            Wrap(
              spacing: 8,
              children: tags.map((tag) {
                return ChoiceChip(
                  label: Text(tag),
                  selectedColor: Colors.black,
                  selected: _choice == tag,
                  onSelected: (value) {
                    setState(() {
                      print(value);
                      _choice = tag;
                    });
                  },
                );
              }).toList(),
            ),
            Divider(
              height: 1,
            ),
            DataTable(
              sortColumnIndex: _sortIndex,
              sortAscending: _sortSeleted,
              columns: [
                DataColumn(
                  label: Text("name"),
                  onSort: (int index , bool isseleted){
                     setState(() {
                        _sortIndex = index;
                        _sortSeleted = isseleted;

                          //根据字符长度排序
                        post.sort((a,b){
                           if(!isseleted){
                              final c =a;
                              a =b;
                              b = c;
                              
                           }
                           return a.title.length.compareTo(b.title.length);
                            
                        }) ;
                     });
                  }
                ),
                DataColumn(
                  label: Text("name"),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                  DataCell(
                    Text("eljlsjle"),
                  ),
                  DataCell(
                    Text("afdafee"),
                  ),
           
                ]),
                 DataRow(
                  cells: [
                  DataCell(
                    Text("llllll"),
                  ),
                  DataCell(
                    Text("mdfjewofj"),
                  ),
           
                ]),
              ],
            ),
          Divider(height: 1,),

         Container(
           child:  Stepper(
             currentStep: _currentStep,
             onStepTapped: (int vale ){ //点击step
               setState(() {
                _currentStep =vale ; 
               });
             },
             onStepContinue: (){
               setState(() {
                 _currentStep <2 ?_currentStep +=1 :_currentStep =0; 
               });
             },
             onStepCancel: (){
               setState(() {
                _currentStep >0? _currentStep -= 1:_currentStep =0;
               });
             },
            steps: [
               Step(
                 title: Text("Login"),
                 subtitle: Text("login first "),
                 content: Text("manage contniulj;a"),
                 isActive: _currentStep == 0 //是否被选中
                 

               ),
                 Step(
                 title: Text("Login"),
                 subtitle: Text("login first "),
                 content: Text("manage contniulj;a"),
                  isActive: _currentStep == 1 

               ),
                 Step(
                 title: Text("Login"),
                 subtitle: Text("login first "),
                 content: Text("manage contniulj;a"),
                 isActive: _currentStep == 2
               ),
            ],
          ),
         )





          ],
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            //这个可以做一个充值的功能
            //  tags = tags;
          });
        },
      ),
    );
  }
}
