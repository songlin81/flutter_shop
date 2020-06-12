import 'package:flutter/material.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String homePageContent = '正在获取数据';

  @override
  void initState(){
    getHomePageContent().then((value){
      setState(() {
        homePageContent=value.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商城首页'),),
      body: SingleChildScrollView(
        child: Text(homePageContent),
      ),
    );
  }
}


//Section 0.3
//import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
//import '../config/HttpHeaders.dart';
//
//class HomePage extends StatefulWidget{
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//
//  String showText = '数据未加载';
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Scaffold(
//        appBar: AppBar(title: Text('远程数据请求'),),
//        body: SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              RaisedButton(
//                onPressed: _buildAction,
//                child: Text('请求数据'),
//              ),
//              Text(showText)
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  Future getHttp() async{
//    try{
//      Response response;
//      Dio dio = new Dio();
//      dio.options.headers = httpHeaders;
//      response = await dio.get("https://time.geekbang.org/serv/v1/column/newAll");
//      print(response);
//      print('==>'+response.data.toString());
//      return response.data;
//    }catch(e){
//      return print(e);
//    }
//  }
//
//  void _buildAction(){
//    getHttp().then((val){
//        setState(() {
//          showText = val['data'].toString();
//        });
//      }
//    );
//  }
//}


//Section 0.2
//import 'dart:convert';
//import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
//
//class HomePage extends StatefulWidget{
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//
//  TextEditingController typeController = TextEditingController();
//  String showText = '起始内容';
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text('订单内容')
//        ),
//        body: SingleChildScrollView(
//          child: Container(
//            child: Column(
//              children: <Widget>[
//                TextField(
//                  controller: typeController,
//                  decoration: InputDecoration(
//                    contentPadding: EdgeInsets.all(10.0),
//                    labelText: '类型',
//                    helperText: '请输入类型：',
//                  ),
//                  autofocus: false,
//                ),
//                RaisedButton(
//                  onPressed: (){
//                    _choiceAction();
//                  },
//                  child: Text('选择完毕'),
//                ),
//                Text(
//                  showText,
//                  overflow: TextOverflow.ellipsis,
//                  maxLines: 1,
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//
//  void _choiceAction(){
//    if(typeController.text.toString()==''){
//      showDialog(
//        context: context,
//        builder: (context) => AlertDialog(title: Text('不可为空'),)
//      );
//    }else{
//      postHttp(typeController.text.toString()).then((value){
//        setState((){
//          print('===>'+value.toString());
//          showText=value['data']['name'].toString();
//        });
//      });
//
////      getHttp(typeController.text.toString()).then((value){
////        setState((){
////          print('===>'+value.toString());
////          print(json.decode(value));
////          showText=json.decode(value)['data']['name'].toString();
////        });
////      });
//    }
//  }
//
//  Future getHttp(String TypeText) async {
//    try{
//      Response response;
//      var data = {'name': TypeText};
//      response = await Dio().get(
//          'http://zjg5l.mocklab.io/storecheck',
//          queryParameters: data
//      );
//      return response.data;
//    }catch(e){
//      print(e);
//    }
//  }
//
//  Future postHttp(String TypeText) async {
//    try{
//      Response response;
//      var data = {'name': TypeText};
//      response = await Dio().post(
//          'http://zjg5l.mocklab.io/storecheck',
//          data: data
//      );
//      return response.data;
//    }catch(e){
//      print(e);
//    }
//  }
//}


//Section 0.1
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