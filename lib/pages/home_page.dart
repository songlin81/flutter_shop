import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttershop/model/category.dart';
import 'package:fluttershop/provide/child_category.dart';
import 'package:fluttershop/provide/currentIndex.dart';
import 'package:provide/provide.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../routers/application.dart';

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  int page = 1;
  List<Map> hotGoodsList = [];
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState(){
    super.initState();
    _getHotGoods();
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
    var formData = {'lon':'115.02932', 'lat':'35.76189'};
    return Scaffold(
      appBar: AppBar(title: Text('商城首页'),),
      body: FutureBuilder(
        //future: getHomePageContent(),
        future: request('homePageContent', formData: formData),
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
            String floor2Title = data['data']['floor2Pic']['Picture_Address'];
            List<Map> floor2 = (data['data']['floor2'] as List).cast();
            String floor3Title = data['data']['floor3Pic']['Picture_Address'];
            List<Map> floor3 = (data['data']['floor3'] as List).cast();
            //return SingleChildScrollView(

            return EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: _footerKey,
                bgColor: Colors.white,
                textColor: Colors.blueAccent,
                moreInfoColor: Colors.pink,
                showMore: true,
                noMoreText: '',
                moreInfo: '加载中',
                loadReadyText: '上拉加载',
              ),
              child: ListView(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiper),
                  TopNavigator(navigatorList: navigatorList),
                  AdBanner(adPicture: adPicture),
                  ContactPhone(contactImage: contactImage, contactPhoneNumber: contactPhoneNumber),
                  Recommend(recommendList: recommendList),
                  FloorTitle(picture_address: floorTitle),
                  FloorContent(floorGoodsList: floor1),
                  FloorTitle(picture_address: floor2Title),
                  FloorContent(floorGoodsList: floor2),
                  FloorTitle(picture_address: floor3Title),
                  FloorContent(floorGoodsList: floor3),
                  //HotGoods()
                  _hotGoods()
                ],
              ),
              loadMore:() async {
                var formData = {'page':page};
                await request('homePageBelowContent', formData: formData).then((value) {
                  var data = json.decode(value.toString());
                  List<Map> newGoodsList = (data['data'] as List).cast();
                  setState(() {
                    hotGoodsList.addAll(newGoodsList);
                    page++;
                  });
                });
              }
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

  void _getHotGoods(){
    var formData = {'page':page};
    request('homePageBelowContent', formData: formData).then((value) {
      var data = json.decode(value.toString());
      List<Map> newGoodsList = (data['data'] as List).cast();
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++;
      });
    });
  }

  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    padding: EdgeInsets.all(5.0),
    child: Text('On Sales'),
  );

  Widget _wrapList(){
    if(hotGoodsList.length!=0){
      List<Widget> listWidget = hotGoodsList.map((val){
        return InkWell(
          onTap: (){
            Application.router.navigateTo(context, "/detail?id=${val['goodsId']}");
          },
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(val['image'], width: ScreenUtil().setWidth(370),),
                Text(
                  val['name'],
                  maxLines: 1, 
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text("RMB ${val['mallPrice']} "),
                    Text(
                      "RMB ${val['Price']}",
                      style: TextStyle(color: Colors.black26, decoration: TextDecoration.lineThrough),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    }else{
      return Text('');
    }
  }

  Widget _hotGoods(){
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList()
        ],
      ),
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
          return InkWell(
            onTap: (){
              Application.router.navigateTo(context, "/detail?id=${swiperDataList[index]['goodsId']}");
            },
            child: Image.network("${swiperDataList[index]['image']}", width: 320, height: 180, fit: BoxFit.fill,),
          );
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

  Widget _gridViewItemUI(BuildContext context, item, index){
    return InkWell(
      onTap: (){
        _goCategory(context, index, item['mallCategoryId']);
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95)),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  void _goCategory(context,int index,String categroyId) async {
    await request('getCategory').then((val) {
      var data = json.decode(val.toString());
      CategoryModel category = CategoryModel.fromJson(data);
      List list = category.data;
      Provide.value<ChildCategory>(context).changeCategory(categroyId,index);
      Provide.value<ChildCategory>(context).getChildCategory(list[index].bxMallSubDto,categroyId);
      Provide.value<CurrentIndexProvide>(context).changeIndex(1);
    });
  }

  @override Widget build(BuildContext context) {
    if(navigatorList.length>10){
      this.navigatorList.removeRange(10, this.navigatorList.length);
    }
    var tempIndex=-1;
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item){
          tempIndex++;
          return _gridViewItemUI(context, item, tempIndex);
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
      padding: EdgeInsets.all(8.0),
      child: Image.network(adPicture, fit: BoxFit.fill),
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
      height: ScreenUtil().setHeight(80),
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
        style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  Widget _item(context, index){
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, "/detail?id=${recommendList[index]['goodsId']}");
      },
      child: Container(
        height: ScreenUtil().setHeight(310),
        width: ScreenUtil().setWidth(225),  // =750/3
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1.0, color: Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image'], width: ScreenUtil().setWidth(225), height: ScreenUtil().setHeight(180),),
            Text(
                new String.fromCharCodes(new Runes('\u0024'))+"${recommendList[index]['mallPrice']}",
                style: TextStyle(fontSize: ScreenUtil().setSp(40))),
            Text(
              new String.fromCharCodes(new Runes('\u0024'))+"${recommendList[index]['Price']}",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
                  fontSize: ScreenUtil().setSp(40)
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _recommendList(){
    return Container(
      height: ScreenUtil().setHeight(320),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index){
          return _item(context, index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
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
      child: Image.network(picture_address, fit: BoxFit.fill),
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
          _firstRow(context),
          _otherGoods(context)
        ],
      ),
    );
  }

  Widget _firstRow(BuildContext context){
    return Row(
      children: <Widget>[
        _goodsItem(context, floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(context, floorGoodsList[1]),
            _goodsItem(context, floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods(BuildContext context){
    return Row(
      children: <Widget>[
        _goodsItem(context, floorGoodsList[3]),
        _goodsItem(context, floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(BuildContext context, Map goods){
    return Container(
      width: ScreenUtil().setWidth(750/2),
      height: ScreenUtil().setHeight(140),
      child: InkWell(
        onTap: (){
          Application.router.navigateTo(context, "/detail?id=${goods['goodsId']}");
        },
        child: Image.network(goods['image'],  fit: BoxFit.fitHeight),
      ),
    );
  }
}


//class HotGoods extends StatefulWidget {
//  _HotGoodsState createState() => _HotGoodsState();
//}
//
//class _HotGoodsState extends State<HotGoods>{
//  @override
//  void initState(){
//    super.initState();
//    request('homePageBelowContent', formData: 1).then((value){
//      //      setState(() {
////        homePageContent=value.toString();
////      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Text('temp'),
//    );
//  }
//}

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