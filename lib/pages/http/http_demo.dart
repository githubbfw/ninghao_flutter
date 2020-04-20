import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:ninghao_flutter/model/post.dart';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("http"),
      ),
      body: HttpDemoHome(),
    );
  }
}



class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {

  @override
  void initState() { 
    super.initState();
      // fetchPosts()
      //   .then((value){
      //   print(value);
      //   });
  }
  
 Future<List<Post>> fetchPosts()async{
   
   final response = await http.get("https://resources.ninghao.net/demo/posts.json");
  //  print("${response.statusCode}");
  //  print("${response.body}");
  
       if (response.statusCode ==200) {
         final responseBody =json.decode(response.body);

           List<Post> posts = (responseBody["posts"]).map<Post>((item){
                Post.fromJons(item);
           }).toList();

      // List<Post> posts = (responseBody["posts"]as List).map<Post>((item) =>Post.fromJons(item)).toList();

         return posts;
         
       } else {
         throw Exception("falid to data");
       }
  }



  @override
  Widget build(BuildContext context) {

  
  //  final post = {
  //    "title":"haolong",
  //    "des":"1111111111111111",

  //  };

  //  print(post is Map);

  //    final aa = json.encode(post);
  //    print(aa);


    // final postModel= Post.fromJons(post);

    //  print(postModel.title);



  //  print((json.encode(post)));
  






    return  FutureBuilder(
             future: fetchPosts(),
             builder: (BuildContext context,AsyncSnapshot snapshot){

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("waiting....."),
                );
              } else {
               
                if (snapshot.data ==null) {
                  return Text("data NULL");
                } else {
                  return  ListView(
                   children: snapshot.data.map<Widget>((item){
                       return ListTile(
                         title: Text(item.title),
                         subtitle:Text(item.author),
                         leading: CircleAvatar(
                           backgroundImage: NetworkImage(item.imageUrl),
                         ),
                       )  ;      
                   }).toList(),

                 );
                }

              

              }
             }, 
      

      
    );
  }
}


class Post{
 final   int id;
 final   String title;
 final   String author;
 final   String des;
 final   String imageUrl;

  Post(this.title,this.des, this.id, this.author, this.imageUrl);
   
   Post.fromJons(Map map)
   :id = map["id"],
   title = map["title"],
   author = map["author"],
   imageUrl = map["imageUrl"],
    des = map["des"];


  // Post.fromJons(Map map){
  //     this.title = map["title"];
  //     this.des = map["des"];
  // }

  // Map toJsons()=>{
  //     "title":title,
  //     "des":des,
  // };


}