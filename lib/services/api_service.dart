//this class will allow us to make a simple get http request
//from the API and get the Articles and then return a list of articles
import 'dart:convert';

import 'package:News_App/model/article_model.dart';
import 'package:http/http.dart';
class ApiService{

//we are using single end point

final endPointUrl = 
"https://newsapi.org/v2/top-headlines?country=us&apiKey=e53354dcf4bd453fa49ace9516b3ea3e";

Future<List<Article>> getArticle() async {
 Response res =await get(endPointUrl);

 if(res.statusCode ==200){
   Map<String,dynamic> json =jsonDecode(res.body);

   List<dynamic> body=json['articles'];


   List<Article> articles =body.map((dynamic item)=> Article.fromJson(item)).toList();
   return articles;
 }else{
   throw("Can't get the articles");
 }
}

}