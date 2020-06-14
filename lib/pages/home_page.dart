import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  void initState(){
    super.initState();
    print("111");
  }

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
            List<Map> swiper = (data['data']['slides'] as List).cast();
            List<Map> navigatorList = (data['data']['category'] as List).cast();
            String adPicture = data['data']['adPicture']['Picture_Address'];
            String contactImage = data['data']['shopInfo']['contactImage'];
            String contactPhoneNumber = data['data']['shopInfo']['contactPhoneNumber'];
            List<Map> recommendList = (data['data']['recommend'] as List).cast();
            String floorTitle = data['data']['floor1Pic']['Picture_Address'];
            List<Map> floor1 = (data['data']['floor1'] as List).cast();
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiper),
                  TopNavigator(navigatorList: navigatorList),
                  AdBanner(adPicture: adPicture),
                  ContactPhone(contactImage: contactImage, contactPhoneNumber: contactPhoneNumber),
                  Recommend(recommendList: recommendList),
                  FloorTitle(picture_address: floorTitle),
                  FloorContent(floorGoodsList: floor1)
                ],
              ),
            );
          }else{
            return Center(
              child: Text('加载中', style: TextStyle(fontSize: ScreenUtil().setSp(28, allowFontScalingSelf: false)),),
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

  @override Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network(
            "${swiperDataList[index]['image']}",
            width: 320,
            height: 180,
            fit: BoxFit.fill,);
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

class TopNavigator extends StatelessWidget {

  final List navigatorList;
  TopNavigator({this.navigatorList});

  Widget _gridViewItemUI(BuildContext context, item){
    return InkWell(
      onTap: (){print('点击事件');},
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95)),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override Widget build(BuildContext context) {
    if(navigatorList.length>10){
      this.navigatorList.removeRange(10, this.navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

class AdBanner extends StatelessWidget {

  final String adPicture;
  AdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}

class ContactPhone extends StatelessWidget {

  final String contactImage;
  final String contactPhoneNumber;
  ContactPhone({Key key, this.contactImage, this.contactPhoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap:_launchURL,
        child: Image.network(contactImage),
      ),
    );
  }

  void _launchURL() async{
    String url = 'tel:'+contactPhoneNumber;
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'cannot dial through...';
    }
  }
}

class Recommend extends StatelessWidget{
  final List recommendList;
  Recommend({Key key, this.recommendList}) : super(key: key);

  Widget _titleWidget(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12)
        )
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  Widget _item(index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),  // =750/3
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1.0, color: Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image'], width: ScreenUtil().setWidth(200)),
            Text(new String.fromCharCodes(new Runes('\u0024'))+"${recommendList[index]['mallPrice']}"),
            Text(
              new String.fromCharCodes(new Runes('\u0024'))+"${recommendList[index]['Price']}",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _recommendList(){
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index){
          return _item(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList()
        ],
      ),
    );
  }
}

class FloorTitle extends StatelessWidget{
  final String picture_address;
  FloorTitle({Key key, this.picture_address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}

class FloorContent extends StatelessWidget{
  final List floorGoodsList;
  FloorContent({Key key, this.floorGoodsList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _otherGoods()
        ],
      ),
    );
  }

  Widget _firstRow(){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods(){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(Map goods){
    return Container(
      width: ScreenUtil().setWidth(750/2),
      child: InkWell(
        onTap: (){print('点击了商品');},
        child: Image.network(goods['image']),
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