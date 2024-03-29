import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttershop/pages/widgets/JellyButton.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';
import '../../provide/details_info.dart';
import '../../provide/currentIndex.dart';

class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
    var goodsId = goodsInfo.goodsId;
    var goodsName = goodsInfo.goodsName;
    var count = 1;
    var price = goodsInfo.presentPrice;
    var images = goodsInfo.image1;

    return Container(
      width:ScreenUtil().setWidth(750),
      color: Colors.white,
      height: ScreenUtil().setHeight(80),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              InkWell(
                onTap: (){
                  Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                  Navigator.pop(context);
                },
                child: Container(
                  width: ScreenUtil().setWidth(110),
                  alignment: Alignment.center,
                  child:Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Colors.red,
                  ),
                ),
              ),
              Provide<CartProvide>(
                builder: (context, child, val){
                  int goodsCount = Provide.value<CartProvide>(context).allGoodsCount;
                  return Positioned(
                    top: 0,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Text(
                        '${goodsCount}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(22)
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          InkWell(
            onTap: () async{
              await Provide.value<CartProvide>(context).save(goodsId, goodsName, count, price, images);
              Fluttertoast.showToast(
                  msg: "商品已加入购物车",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.black26,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              color: Colors.green,
              child:
                Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      width: ScreenUtil().setWidth(220),
                      child: Text(
                              '加入购物车',
                              style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(28)),
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        width: ScreenUtil().setWidth(90),
                      child: TestButton(onTap: () async{
                          await Provide.value<CartProvide>(context).save(goodsId, goodsName, count, price, images);
                          Fluttertoast.showToast(
                              msg: "商品已加入购物车",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.black26,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        })
                    )
                  ]
                )
            )
          ),
          InkWell(
            onTap: () async{
              await Provide.value<CartProvide>(context).remove();
            },
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              color: Colors.red,
              child: Text(
                '立即购买',
                style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(28)),
              ),
            ) ,
          ),
        ],
      ),
    );
  }
}

class TestButton extends JellyButton {
  const TestButton({
    VoidCallback onTap,
    bool checked = false,
  }) : super(
    unCheckedImgAsset: 'images/1129218.png',
    checkedImgAsset: 'images/1134354.png',
    size: const Size(50.0, 50.0),
    onTap: onTap,
    checked: checked,
  );
}