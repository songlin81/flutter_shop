import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import 'package:provide/provide.dart';
import '../provide/currentIndex.dart';

//class IndexPage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('e-商城'),
//      ),
//      body: Center(
//        child: Text('details'),
//      ),
//    );
//  }
//}

class IndexPage extends StatelessWidget{

    final List<BottomNavigationBarItem> bottomTabs = [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          title: Text('首页')
        ),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('分类')
        ),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('购物车')
        ),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            title: Text('会员中心')
        )
    ];

  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
            backgroundColor: Color.fromRGBO(244, 245, 245, 1),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              items: bottomTabs,
              onTap: (index) {
                Provide.value<CurrentIndexProvide>(context).changeIndex(index);
              },
            ),
            body: IndexedStack(
              index: currentIndex,
              children: tabBodies,
            )
          //body: currentPage,
        );
      },
    );
  }
}

//class IndexPage extends StatefulWidget{
//  _IndexPageState createState() => _IndexPageState();
//}
//
//class _IndexPageState extends State<IndexPage>{
//
//  final List<BottomNavigationBarItem> bottomTabs = [
//    BottomNavigationBarItem(
//      icon: Icon(CupertinoIcons.home),
//      title: Text('首页')
//    ),
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.search),
//        title: Text('分类')
//    ),
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.shopping_cart),
//        title: Text('购物车')
//    ),
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.profile_circled),
//        title: Text('会员中心')
//    )
//  ];
//
//  final List<Widget> tabBodies = [
//  //final List tabBodies = [
//    HomePage(),
//    CategoryPage(),
//    CartPage(),
//    MemberPage()
//  ];
//
//  int currentIndex = 0;
//  var currentPage;
//
//  @override
//  void initState(){
//    currentPage = tabBodies[currentIndex];
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    ScreenUtil.init(context, width: 750, height: 1334);
//    print('${ScreenUtil.pixelRatio} - ${ScreenUtil.screenHeight} - ${ScreenUtil.screenWidth}');
//
//    return Scaffold(
//      backgroundColor: Color.fromRGBO(244, 245, 245, 1),
//      bottomNavigationBar: BottomNavigationBar(
//        type: BottomNavigationBarType.fixed,
//        currentIndex: currentIndex,
//        items: bottomTabs,
//        onTap: (index){
//          setState(() {
//            currentIndex = index;
//            currentPage = tabBodies[currentIndex];
//          });
//        },
//      ),
//      body: IndexedStack(
//        index: currentIndex,
//        children: tabBodies,
//      )
//      //body: currentPage,
//    );
//  }
//}