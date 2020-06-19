import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model/category.dart';
import '../model/categoryGoodsList.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/child_category.dart';
import '../model/category.dart';
import '../provide/category_goods_list.dart';

class CategoryPage extends StatefulWidget {
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>{
  @override
  Widget build(BuildContext context) {
    //_getCategory();
//    return Container(
//        child: Center(
//          child: Text('分类页面'),
//        )
//    );
    return Scaffold(
      appBar: AppBar(title: Text('商品分类'),),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
             children: <Widget>[
               RightCategoryNav(),
               CategoryGoodsList()
             ],
            )
          ],
        ),
      ),
    );
  }
}

class LeftCategoryNav extends StatefulWidget{
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav>{

  List list = [];
  var listIndex = 0;

  @override
  void initState(){
    _getCategory();
    _getGoodsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return _leftInkWell(index);
        },
      ),
    );
  }

  Widget _leftInkWell(int index){
    bool isClick = false;
    isClick=(index==listIndex)?true:false;
    return InkWell(
      onTap: (){
        setState(() {
          listIndex=index;
        });
        var childList = list[index].bxMallSubDto;
        Provide.value<ChildCategory>(context).getChildCategory(childList);
        var categoryId = list[index].mallCategoryId;
        _getGoodsList(categoryId: categoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: isClick?Color.fromRGBO(236, 236, 236, 1.0):Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12)
          )
        ),
        child: Text(list[index].mallCategoryName, style: TextStyle(fontSize: ScreenUtil().setSp(28)),),
      ),
    );
  }

  void _getCategory() async{
    await request('getCategory').then((value){
      var data = json.decode(value.toString());
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list=category.data;
      });
      Provide.value<ChildCategory>(context).getChildCategory(list[0].bxMallSubDto);

      //      CategoryBigListModel list = CategoryBigListModel.fromJson(data['data']);
      //      list.data.forEach((item) => print(item.mallCategoryName));
    });
  }

  void _getGoodsList({String categoryId}) async{
    var data = {
      'CategoryId' : categoryId==null?'4':categoryId,
      'CategorySubId' : '',
      'page' : 1
    };

    await request('getMallGoods', formData: data).then((val){
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);
//      setState(() {
//        list = goodsList.data;
//      });
      //print('==>${goodsList.data[0].goodsName}');
    });
  }
}

class RightCategoryNav extends StatefulWidget{
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav>{

  //List list =['AA','BB','CC','DD','EE','FF'];

  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory){
        return Container(
          height: ScreenUtil().setHeight(70),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(width: 1, color: Colors.black12)
              )
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childCategoryList.length,
            itemBuilder: (context, index){
              return _rightInkWell(index, childCategory.childCategoryList[index]);
            },
          ),
        );
      },
    );
  }
  
  Widget _rightInkWell(int index, BxMallSubDto item){
    bool isClick = false;
    isClick = (index==Provide.value<ChildCategory>(context).childIndex)?true:false;

    return InkWell(
      onTap: (){
        Provide.value<ChildCategory>(context).changeChildIndex(index);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
            color: isClick?Colors.pink:Colors.black
          ),
        ),
      ),
    );
  }
}

class CategoryGoodsList extends StatefulWidget{
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList>{

  //List list = [];

  @override
  void initState(){
    //_getGoodsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, data){
        return Expanded(
          child: Container(
            width: ScreenUtil().setWidth(570),
            //height: ScreenUtil().setHeight(1000),
            child: ListView.builder(
              itemCount: data.goodsList.length,
              itemBuilder: (context, index){
                return _ListWidget(data.goodsList, index);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _goodsImage(List newList, index){
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index].image),
    );
  }

  Widget _goodsName(List newList, index){
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(List newList, index){
    return Container(
      width: ScreenUtil().setWidth(370),
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Text(
              '价格: ${newList[index].presentPrice}',
              style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30))
          ),
          Text(
              '价格: ${newList[index].oriPrice}',
              style: TextStyle(color: Colors.black26, decoration: TextDecoration.lineThrough)
          ),
        ],
      ),
    );
  }

  Widget _ListWidget(List newList, int index) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black12)
          )
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(newList, index),
            Column(
              children: <Widget>[
                _goodsName(newList, index),
                _goodsPrice(newList, index)
              ],
            )
          ],
        ),
      ),
    );
  }
}


