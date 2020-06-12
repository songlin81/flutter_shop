import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String homePageContent = '正在获取数据';

//  @override
//  void initState(){
//    getHomePageContent().then((value){
//      setState(() {
//        homePageContent=value.toString();
//      });
//    });
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商城首页'),),
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var data = json.decode(snapshot.data.toString());
            print(data);
            print(data['data']['slides']);
            List<Map> swiper = (data['data']['slides'] as List).cast();
            print(data['data']['slides'].runtimeType);
            return Column(
              children: <Widget>[
                SwiperDiy(swiperDataList: swiper)
                //SwiperDiy(swiperDataList: data['data']['slides'])
              ],
            );
          }else{
            return Center(
              child: Text('加载中'),
            );
          }
        },
      ),
//      body: SingleChildScrollView(
//        child: Text(homePageContent),
//      ),
    );
  }
}

class SwiperDiy extends StatelessWidget{
  final List swiperDataList;
  SwiperDiy({this.swiperDataList});

  List<String> banner = <String>[
    'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8be2c9a7bf33fcb3ded7104f979f23e7.jpg',
    'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a4aa0cbfad7de34618c4bebdbdeee4e1.jpg',
    'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/755aca9487082e7698e16f17cfb70839.jpg',
    'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2f424f55554befb780ee50a761b2a768.jpg',
    'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6bd4174b8c5aad67a64864a5716ad152.jpg',
  ];

  @override Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          //print(swiperDataList[index]['image']);
          print(banner[index]);
          return Image.network(
            banner[index],
            //swiperDataList[index]['image'],
            width: 320,
            height: 180,
            fit: BoxFit.cover,);

//          print(index);
//          print(swiperDataList[index]);
//          return Image.network("${swiperDataList[index]}", fit: BoxFit.fill,);
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
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