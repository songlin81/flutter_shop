import 'package:flutter/material.dart';
import '../model/categoryGoodsList.dart';

class CategoryGoodsListProvide with ChangeNotifier{
  List<CategoryListDate> goodsList = [];

  getGoodsList(List<CategoryListDate> list){
    goodsList = list;
    notifyListeners();
  }

  getMoreList(List<CategoryListDate> list){
    goodsList.addAll(list);
    notifyListeners();
  }
}