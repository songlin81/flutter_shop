import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  Widget _(){
    return Container(

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