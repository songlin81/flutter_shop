import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/cart.dart';
import './cart_page/cart_item.dart';
import './cart_page/cart_bottom.dart';

class CartPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot){
          List cartList = Provide.value<CartProvide>(context).cartList;
          if(snapshot.hasData && cartList.length!=null){
            return Stack(
              children: <Widget>[
                Provide<CartProvide>(
                    builder: (context, child, childCategory){
                      cartList = Provide.value<CartProvide>(context).cartList;
                      if(cartList.length>0) {
                        return ListView.builder(
                          itemCount: cartList.length,
                          itemBuilder: (context, index) {
                            return CartItem(cartList[index]);
//                            return ListTile(
//                              title: Text(cartList[index].goodsName),
//                            );
                          },
                        );
                      }else{
                        return Center(
                          child: Text('Cart is empty'),
                        );
                      }
                    }
                ),
                Positioned(
                  bottom:0,
                  left:0,
                  child: CartBottom(),
                )
              ],
            );
            //print(cartList.length);
          }else{
            return Center(
              child: Text('购物车空空'),
            );
          }
        },
      ),
    );
  }

  Future<String> _getCartInfo(BuildContext context) async{
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }
}

//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//class CartPage extends StatefulWidget{
//  @override
//  _CartPageState createState() => _CartPageState();
//}
//
//class _CartPageState extends State<CartPage> {
//
//  List<String> testList = [];
//
//  @override
//  Widget build(BuildContext context) {
//    _show();
//    return Container(
//      child: Column(
//        children: <Widget>[
//          Container(
//            height: 500.0,
//            child: ListView.builder(
//              itemCount: testList.length,
//              itemBuilder: (context, index){
//                return ListTile(
//                  title: Text(testList[index]),
//                );
//              },
//            ),
//          ),
//          RaisedButton(
//            onPressed: (){_add();},
//            child: Text('Add'),
//          ),
//          RaisedButton(
//            onPressed: (){_clear();},
//            child: Text('Clear'),
//          )
//        ],
//      ),
//    );
//  }
//
//  void _add() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String temp = '商品详情ABC!';
//    testList.add(temp);
//    prefs.setStringList('testInfo', testList);
//    _show();
//  }
//
//  void _show() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    if(prefs.getStringList('testInfo')!=null){
//      setState(() {
//        testList = prefs.getStringList('testInfo');
//      });
//    }
//  }
//
//  void _clear() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    //prefs.clear();
//    prefs.remove('testInfo');
//    setState(() {
//      testList = [];
//    });
//  }
//}

//import 'package:provide/provide.dart';
//import '../provide/counter.dart';
//class CartPage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Center(
//          child: Column(
//            children: <Widget>[
//              Number(),
//              MyButton()
//            ],
//          )
//        )
//    );
//  }
//}
//
// class Number extends StatelessWidget{
//  @override
//   Widget build(BuildContext context) {
//    return Container(
//      margin: EdgeInsets.only(top: 200),
//      child: Provide<Counter>(
//        builder: (context, child, counter){
//          return Text(
//              '${counter.value}',
//            style: Theme.of(context).textTheme.headline4,
//          );
//        },
//      ),
//    );
//  }
// }
//
// class MyButton extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: RaisedButton(
//        onPressed: (){
//          Provide.value<Counter>(context).increment();
//        },
//        child: Text('Increment...'),
//      ),
//    );
//  }
//}
