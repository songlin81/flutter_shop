import 'package:flutter/material.dart';
import '../provide/details_info.dart';
import 'package:provide/provide.dart';

class DetailsPage extends StatelessWidget{

  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    _getBackInfo(context);
    return Container(
      child: Center(
        child: Text('商品ID: ${goodsId}'),
      ),
    );
  }

  void _getBackInfo(BuildContext context) async{
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    print("done!!!");
  }
}