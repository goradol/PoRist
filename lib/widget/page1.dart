import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:porist2/models/pageholder_model.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  //Explicit
  List<pageholdermodel> pageHolderModels = [];
  //Method

  @override
  void initState() {
    super.initState();
    readAllData();
    //Future<String> test = xxx();
  }

  ///Future<String> xxx()async{
  ///   return 'abc';
  ///}
  Future<void> readAllData() async {
    String urlAPI = 'https://jsonplaceholder.typicode.com/posts';
    Response response = await get(urlAPI);
    var result = json.decode(response.body);
    print('result================================================= = $result');

    for (var map in result) {
      pageholdermodel holdermodel = pageholdermodel.fromJson(map);
      String title = holdermodel.title;
      print('title=============================================================== $title');

      setState(() {
        pageHolderModels.add(holdermodel);
      });
    }
  }

  Widget showTitle(int index){
    return Text(pageHolderModels[index].title);
  }

  Widget showListView(int index) {
    return Container(decoration: index % 2 == 0 ?BoxDecoration(color: Colors.blue[100]):
    BoxDecoration(color: Colors.blue[200]),
      child: Column(
        children: <Widget>[
          showTitle(index),Divider(),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    //return Center(child: Text('หน้าที่ 1'),);
    return ListView.builder(
      itemCount: pageHolderModels.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(pageHolderModels[index].title);
      },
    );
  }
}
