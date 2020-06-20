import 'package:flutter/material.dart';
import 'package:fluttershop/pages/details_page/details_tabbar.dart';
import '../provide/details_info.dart';
import 'package:provide/provide.dart';
import './details_page/details_top_area.dart';
import 'details_page/details_explain.dart';

class DetailsPage extends StatelessWidget{

  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    _getBackInfo(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('商品详细页'),
      ),
      body: FutureBuilder(
        future: _getBackInfo(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Container(
              child: Column(
                children: <Widget>[
                  //Text('...${goodsId}'),
                  DetailsTopArea(),
                  DetailsExplain(),
                  DetailsTabBar(),
                ],
              ),
            );
          }else{
            return Text('加载中。。。');
          }
        },
      ),
    );
//    return Container(
//      child: Center(
//        child: Text('商品ID: ${goodsId}'),
//      ),
//    );
  }

  Future _getBackInfo(BuildContext context) async{
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    return '完成加载';
  }
}