import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:fluttershop/pages/web_page.dart';
import '../pages/details_page.dart';
import '../pages/jg_page.dart';

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String goodsId = params['id'].first;
    print('index>details goodsId is ${goodsId}');
    return DetailsPage(goodsId);
  }
);

Handler jgHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params){
      return jgPage();
    }
);

Handler webHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params){
      return webPage();
    }
);

