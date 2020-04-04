class Post{
   final String title;
   final String auther;
   final String imageUrl;

   const Post({
     this.title,
     this.auther,
     this.imageUrl
   });

// 这个是2中不一样的写法 
//  const Post(this.title,this.auther,this.imageUrl);



}

  //  final List<Post> post = [
  //        Post("bnif", "1445", "4444445")

  //  ];
  

  final List<Post> post = [
    Post(
      title: "1111",
      auther: "2222",
      imageUrl: "https://www.baidu.com/img/baidu_jgylogo3.gif",
    ),

    Post(
      title: "3333",
      auther: "4444",
      imageUrl: "https://www.baidu.com/img/baidu_jgylogo3.gif",
    ),
        Post(
      title: "5555",
      auther: "6666",
      imageUrl: "https://www.baidu.com/img/baidu_jgylogo3.gif",
    ),

 ];