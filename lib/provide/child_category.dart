import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier{
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0;
  String categoryId = '4';

  getChildCategory(List<BxMallSubDto> list, String id){

    childIndex = 0;
    categoryId = id;

    BxMallSubDto all = BxMallSubDto();
    all.mallSubId='00';
    all.mallCategoryId='00';
    all.mallSubName='全部';
    all.comments="";

    childCategoryList=[all];
    childCategoryList.addAll(list);
    //childCategoryList = list;
    notifyListeners();
  }

  changeChildIndex(index){
    childIndex=index;
    notifyListeners();
  }
}