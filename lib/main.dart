import 'package:News_App/components/customListTitle.dart';
import 'package:News_App/model/article_model.dart';
import 'package:News_App/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home:HomePage(),
    );
  }
}
//calendar_view_day

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ApiService client =ApiService(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor:Colors.white,
        
        title:Text('NEWSAHOLIC.in',style: TextStyle(fontWeight: FontWeight.w700,color:Colors.indigo[700]),),
        leading:GestureDetector(
          onTap: (){},
            child:Icon(Icons.calendar_view_day,color: Colors.black,size:30),
          
        ),
        actions: [
          Padding(padding: EdgeInsets.only(right:5)),
          
          
            Icon(Icons.brightness_high_rounded,color: Colors.black,size:30),
             SizedBox(width:30),
          
        ],
      ),
      body:FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context,AsyncSnapshot<List<Article>>snapshot){
         if(snapshot.hasData){
          List<Article> articles=snapshot.data;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context,index)=>customListTitle(articles[index],context),
          );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}