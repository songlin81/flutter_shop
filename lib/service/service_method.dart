import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

Future request(url, formData) async{
  try{
    print('pulling data...');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded';

    if(formData==null){
      response = await dio.post(servicePath[url]);
    }else{
      response = await dio.post(servicePath[url], data: formData);
    }

    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常');
    }
  }catch(e){
    return print('ERROR: ======>${e}');
  }
}

Future getHomePageContent() async{
  try{
    print('pulling home page data...');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded';
    var formData = {'lon':'115.02932', 'lat':'35.76189'};
    response = await dio.post(servicePath['homePageContent'], data: formData);
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常');
    }
  }catch(e){
    return print('ERROR: ======>${e}');
  }
}

Future getHomePageBelowContent() async{
  try{
    print('pulling sells data...');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded';
    int page = 1;
    response = await dio.post(servicePath['homePageBelowContent'], data: page);
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常');
    }
  }catch(e){
    return print('ERROR: ======>${e}');
  }
}