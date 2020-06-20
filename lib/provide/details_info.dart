import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier{
  DetailsModel goodsInfo = null;

  getGoodsInfo(String id){
    var formData = {'goodsId' : id};
    request('getGoodsDetailById', formData: formData).then((value){
      var responseData = json.decode(value.toString());
      //print(responseData);
      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }
}