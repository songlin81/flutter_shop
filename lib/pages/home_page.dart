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
//      Response response = await Dio().get('http://zjg5l.mocklab.io/dabaojian?name=123');
//      return print(response);
//    }catch(e){
//      return print(e);
//    }
//  }
//}