import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:fluttershop/pages/details_page.dart';
import './router_handler.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static String jgPage = '/jg';

  static void configurateRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params){
        print('Error===>route is not found');
      }
    );

    router.define(detailsPage, handler: detailsHandler);
    router.define(jgPage, handler: jgHandler);
  }
}