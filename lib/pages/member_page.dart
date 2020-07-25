import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttershop/pages/dialogs/stylingModalDialogs.dart';
import '../routers/application.dart';
import '../pages/dialogs/customModalDialogs.dart';
import 'dialogs/customModalDialogsWithImage.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("会员中心"),
      ),
      body: ListView(
        children: <Widget>[
          _topHeader(),
          _orderTitle(),
          _orderType(context),
          _actionList()
        ],
      ),
    );
  }

  Widget _topHeader(){
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(20),
      color: Colors.pinkAccent,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child: Image.network('http://tvax3.sinaimg.cn/crop.37.0.958.958.180/68754f53ly8fq51134oj3j20sp0sp0y3.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'Lin, Song',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: Colors.black54
              ),
            ),

          )
        ],
      ),
    );
  }

  Widget _orderTitle(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _orderType(context){
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: ScreenUtil().setWidth(740),
      height: ScreenUtil().setHeight(187),
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(187),
            child: InkWell(
              onTap: (){Application.router.navigateTo(context, "/jg");},
              child: Column(
                children: <Widget>[
                  Icon(Icons.party_mode, size: 30),
                  Text('待付款')
                ],
              ),
            )
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: InkWell(
              //onTap: (){ showSimpleCustomDialog(context); },
              onTap: (){ CustomModalDialogs().showSimpleCustomDialog(context, 'Goto push message'); },
              child: Column(
                children: <Widget>[
                  Icon(Icons.query_builder, size: 30),
                  Text('待发货')
                ],
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: InkWell(
              onTap: (){ StylingModalDialogs().showStylingCustomDialog(context, 'Goto push message'); },
              child: Column(
                children: <Widget>[
                  Icon(Icons.directions_car, size: 30),
                  Text('待收货')
                ],
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: InkWell(
              onTap: (){
                  CustomModalDialogsWithImage().showCustomDialogWithImage(context, 'Goto push message');},
              child: Column(
                children: <Widget>[
                  Icon(Icons.content_paste, size: 30),
                  Text('待评价')
                ],
              ),
            )
          )
        ],
      ),
    );
  }

//  void showSimpleCustomDialog(BuildContext context) {
//    Dialog simpleDialog = Dialog(
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.circular(12.0),
//      ),
//      child: Container(
//        height: 300.0,
//        width: 300.0,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.all(15.0),
//              child: Text(
//                'Simpe Custom Modal Dialog....',
//                style: TextStyle(color: Colors.red),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.end,
//                children: <Widget>[
//                  RaisedButton(
//                    color: Colors.blue,
//                    onPressed: () {
//                      Navigator.of(context).pop();
//                      Application.router.navigateTo(context, "/jg");
//                    },
//                    child: Text(
//                      'Okay',
//                      style: TextStyle(fontSize: 18.0, color: Colors.white),
//                    ),
//                  ),
//                  SizedBox(
//                    width: 20,
//                  ),
//                  RaisedButton(
//                    color: Colors.red,
//                    onPressed: () {
//                      Navigator.of(context).pop();
//                    },
//                    child: Text(
//                      'Cancel!',
//                      style: TextStyle(fontSize: 18.0, color: Colors.white),
//                    ),
//                  )
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//    showDialog(
//        context: context, builder: (BuildContext context) => simpleDialog);
//  }

  Widget _myListTile(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _actionList(){
   return Container(
     margin: EdgeInsets.only(top: 10),
     child: Column(
       children: <Widget>[
         _myListTile('领取优惠券'),
         _myListTile('已领取优惠券'),
         _myListTile('地址管理'),
         _myListTile('客服电话'),
         _myListTile('关于我们')
       ],
     ),
   );
  }
}

//import 'package:provide/provide.dart';
//import '../provide/counter.dart';
//
//class MemberPage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Center(
//          child: Provide<Counter>(
//            builder: (context, child, counter){
//              return Text(
//                '${counter.value}',
//                style: Theme.of(context).textTheme.headline4,
//              );
//            },
//          ),
//        )
//    );
//  }
//}