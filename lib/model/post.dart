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
      title: "aflaal;",
      auther: "2222",
      imageUrl: "https://www.baidu.com/img/baidu_jgylogo3.gif",
    ),

    Post(
      title: "aaa",
      auther: "4444",
      imageUrl: "https://www.baidu.com/img/baidu_jgylogo3.gif",
    ),
        Post(
      title: "aa",
      auther: "6666",
      imageUrl: "https://www.baidu.com/img/baidu_jgylogo3.gif",
    ),

 ];