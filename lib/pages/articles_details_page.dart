import 'package:flutter/material.dart';
import '../model/article_model.dart';
//import '../components/customListTitle.dart';

class ArticlePage extends StatelessWidget {

 final Article article;
 
  ArticlePage({this.article});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body:Padding(
        padding:const EdgeInsets.all(8),
        child:Column(
          children: [
             Container(
            width: 700,
            height:200,
            decoration:BoxDecoration(
              image:DecorationImage(
                fit: BoxFit.cover,
                image:NetworkImage(article.urlToImage)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
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
            article.description,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
          ],
        )
      )
    );
  }
}