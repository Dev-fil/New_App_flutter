import 'package:flutter/material.dart';
import '../model/article_model.dart';
import '../pages/articles_details_page.dart';

Widget customListTitle(Article article,BuildContext context){
    image(urlToImage){
      if(urlToImage == null){
        return SizedBox(height: 10,);
        }
        else{
         // print ("Image exists...");
          return Container(
            width: 700,
            height:200,
            decoration:BoxDecoration(
              image:DecorationImage(
                fit: BoxFit.cover,
                image:NetworkImage(urlToImage)),
              borderRadius: BorderRadius.circular(8),
            ),
          );
        }
    }

  return
  InkWell(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> ArticlePage(article:article,))
      );
    },
   child: Container(
    margin:EdgeInsets.all(12),
    padding:EdgeInsets.all(8),
    decoration:BoxDecoration(
      color:Colors.white,
      borderRadius:BorderRadius.circular(12),
      boxShadow:[
        BoxShadow(
          color:Colors.black12,
          blurRadius:3,
        )
      ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image(article.urlToImage),
          SizedBox(height:8),
          Container(
            padding:EdgeInsets.all(6.0),
            decoration:BoxDecoration(
              color:Colors.red,
              borderRadius:BorderRadius.circular(30),
            ),
            child: Text(article.source.name,style: TextStyle(color: Colors.white),),
          ),
          SizedBox(height:8),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ],
    ),
  ));
}