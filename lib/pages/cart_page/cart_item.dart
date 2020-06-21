import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/cartInfo.dart';
import 'cart_count.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';

class CartItem extends StatelessWidget{
  final CartInfoModel item;
  CartItem(this.item);

  @override
  Widget build(BuildContext context) {
    //print(item);
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: Row(
        children: <Widget>[
          _cartCheckBtn(context, item),
          _cartImage(),
          _cartGoodsName(),
          _cartPrice(context, item)
        ],
      ),
    );
  }

  Widget _cartCheckBtn(context, item){
    return Container(
      child: Checkbox(
        value: item.isCheck,
        activeColor: Colors.pink,
        onChanged: (bool val){  },
      ),
    );
  }

  Widget _cartImage(){
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12)
      ),
      child: Image.network(item.images),
    );
  }

  Widget _cartGoodsName(){
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.goodsName),
          CartCount(item)
        ],
      ),
    );
  }

  Widget _cartPrice(context, item){
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text('\$ ${item.price}'),
          Container(
            child: InkWell(
              onTap: (){ Provide.value<CartProvide>(context).deleteOneGoods(item.goodsId); },
              child: Icon(
                Icons.delete,
                color: Colors.black26,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

}