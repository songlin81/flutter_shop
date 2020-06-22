import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cartInfo.dart';
import 'dart:convert';

class CartProvide with ChangeNotifier {

  String cartString="[]";
  List<CartInfoModel> cartList = [];
  double allPrice = 0;
  int allGoodsCount = 0;

  save(goodsId, goodsName, count, price, images) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString=prefs.getString('cartInfo');

    var temp=cartString==null?[]:json.decode(cartString.toString());
    List<Map> tempList= (temp as List).cast();

    var isHave= false;
    int ival=0;
    allPrice=0;
    allGoodsCount=0;
    tempList.forEach((item) {
      if(item['goodsId']==goodsId){
        tempList[ival]['count']=item['count']+1;
        cartList[ival].count++;
        isHave=true;
      }
      if(item['isCheck']){
        allPrice+= (cartList[ival].price* cartList[ival].count);
        allGoodsCount+= cartList[ival].count;
      }
      ival++;
    });

    if(!isHave){
      Map<String, dynamic> newGoods={
        'goodsId':goodsId,
        'goodsName':goodsName,
        'count':count,
        'price':price,
        'images':images,
        'isCheck': true
      };
      tempList.add(newGoods);
      cartList.add(new CartInfoModel.fromJson(newGoods));
      allPrice+= (count * price);
      allGoodsCount+=count;
    }

    allPrice = double.parse(allPrice.toStringAsFixed(2));
    print('===> ${allPrice.toStringAsFixed(2)}');

    cartString= json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    notifyListeners();
  }

  remove() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    cartList=[];
    allPrice =0 ;
    allGoodsCount=0;
    print('All clear!');
    notifyListeners();
  }

  getCartInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');

    cartList=[];
    if(cartString==null){
      cartList=[];
    }else{
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      allPrice = 0;
      allGoodsCount = 0;
      tempList.forEach((item) {
        cartList.add(new CartInfoModel.fromJson(item));
        if(item['isCheck']){
          allPrice += (item['count']*item['price']);
          allGoodsCount += item['count'];
        }
      });
    }

    allPrice = double.parse(allPrice.toStringAsFixed(2));
    notifyListeners();
  }

  deleteOneGoods(String goodsId) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList= (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int delIndex = 0;
    tempList.forEach((item) {
      if(item['goodsId']==goodsId){
        delIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList.removeAt(delIndex);

    cartString= json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);

    await getCartInfo();
  }
}