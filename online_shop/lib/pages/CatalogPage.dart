import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CatalogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyState();
  }
}

class MyState extends State<CatalogPage> {  
  
  List questions;
  String endpoint = "https://api.stackexchange.com/2.2/questions?" +
  "pagesize=100&order=desc&sort=activity&site=stackoverflow";

  @override
  void initState() {
    super.initState();
    loadData();
  }
 
  void loadData() async {
    // More code here
    String rawData = (await http.get(endpoint)).body;
    Map jsonData = jsonDecode(rawData);
    
    setState(() {
      questions = jsonData["items"];
    }); 
  }
  
  @override
  Widget build(BuildContext context) {
    ListView myList = ListView.builder(
    itemCount: questions == null ? 0 : questions.length,
    itemBuilder: (BuildContext context, int index) {
      return new ListTile(
          title: Text(questions[index]["title"]),
          subtitle: Text("Asked by ${questions[index]["owner"]["display_name"]}"),
        );
      }
    );
    return new Scaffold(
      body: myList,
    );
  }
}