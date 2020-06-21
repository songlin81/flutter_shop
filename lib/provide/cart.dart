import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cartInfo.dart';
import 'dart:convert';

class CartProvide with ChangeNotifier {

  String cartString="[]";
  List<CartInfoModel> cartList = [];

  save(goodsId, goodsName, count, price, images) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString=prefs.getString('cartInfo');

    var temp=cartString==null?[]:json.decode(cartString.toString());
    List<Map> tempList= (temp as List).cast();

    var isHave= false;
    int ival=0;
    tempList.forEach((item) {
      if(item['goodsId']==goodsId){
        tempList[ival]['count']=item['count']+1;
        cartList[ival].count++;
        isHave=true;
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
    }

    cartString= json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    notifyListeners();
  }

  remove() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    cartList=[];
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
      tempList.forEach((item) {
        cartList.add(new CartInfoModel.fromJson(item));
      });
    }

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