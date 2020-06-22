import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier{
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0;
  String categoryId = '4';
  String subId='';
  int page = 1;
  String noMoreText='';
  bool isNewCategory= true;
  int categoryIndex=0;

  changeCategory(String id, int index){
    categoryId=id;
    categoryIndex=index;
    subId ='';
    notifyListeners();
  }

  getChildCategory(List<BxMallSubDto> list, String id){
    page = 1;
    noMoreText='';
    childIndex = 0;
    categoryId = id;
    isNewCategory=true;
    subId='';

    BxMallSubDto all = BxMallSubDto();
    all.mallSubId='';
    all.mallCategoryId='00';
    all.mallSubName='全部';
    all.comments="";

    childCategoryList=[all];
    childCategoryList.addAll(list);
    //childCategoryList = list;
    notifyListeners();
  }

  changeChildIndex(index, String id){
    page = 1;
    noMoreText='';
    isNewCategory=true;

    childIndex = index;
    subId = id;
    notifyListeners();
  }

  addPage(){
    page++;
  }

  changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }

  changeFalse(){
    isNewCategory=false;
  }
}