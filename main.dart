import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() async{
  List _data = await getjson();
  runApp(
    new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('JSON Parsing'),
          centerTitle: true,
        ),
        body: new Center(
          child: new ListView.builder(
              itemCount: _data.length,
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (BuildContext context, int position){
                if(position.isOdd)return new Divider();
                return new ListTile(
                  title: new Text("${_data[position]['title']}",
                    style: new TextStyle(
                        fontSize: 18.9),
                  ),
                  subtitle: new Text("${_data[position]['body']}"),
                  leading: new CircleAvatar(
                    backgroundColor: Colors.blue,
                    child:new Text("${_data[position]['body'][0]}".toUpperCase(),
                     style: new TextStyle(
                       fontSize: 20.0,
                       color: Colors.white,
                     ),
                    ),
                  ),
                );
              }
          ),
        ),
      ),
    )
  );
}

Future<List> getjson() async{
  String url = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}