import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController typeController = TextEditingController();
  String showText = '起始内容';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('订单内容')
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '类型',
                  helperText: '请输入类型：',
                ),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: (){
                  _choiceAction();
                },
                child: Text('选择完毕'),
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _choiceAction(){
    if(typeController.text.toString()==''){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('不可为空'),)
      );
    }else{
      getHttp(typeController.text.toString()).then((value){
        setState((){
          print(json.decode(value));
          showText=json.decode(value)['name'].toString();
        });
      });
    }
  }

  Future getHttp(String TypeText) async {
    try{
      Response response;
      var data = {'name': TypeText};
      response = await Dio().get(
          'http://zjg5l.mocklab.io/storecheck',
          queryParameters: data
      );
      return response.data;
    }catch(e){
      print(e);
    }
  }
}

//class HomePage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    getHttp();
//    return Scaffold(
//      body: Center(
//        child: Text('商城首页'),
//      )
//    );
//  }
//
//  void getHttp() async {
//    try{
//      Response response = await Dio().get('http://zjg5l.mocklab.io/storecheck?name=123');
//      return print(response);
//    }catch(e){
//      return print(e);
//    }
//  }
//}