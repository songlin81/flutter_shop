import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class jgPage extends StatefulWidget{
  _jpPageState createState() => _jpPageState();
}

class _jpPageState extends State<jgPage>{
  String debugLabel = 'Unknown';
  final JPush jPush = new JPush();

  @override
  void initState(){
    super.initState();
  }

  Future<void> initPlatformState() async{
    String platformVersion;
    try{
      jPush.addEventHandler(
        onReceiveNotification: (Map<String, dynamic> message) async{
          print("===>push message received: ${message}");
          setState(() {
            debugLabel = "接收到： ${message}";
          });
        }
      );
    }on PlatformException{
      platformVersion = "版本获取失败，请检查";
    }

    if(!mounted) return;
    setState(() {
      debugLabel = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text('Ji Guang Push'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('结果： ${debugLabel}'),
              FlatButton(
                child: Text('发送推送信息'),
                onPressed: (){
                  var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch+3000);
                  var localNotification = LocalNotification(
                    id: 123,
                    title: "Song's message...",
                    buildId: 1,
                    content: '接受正常',
                    fireTime: fireDate,
                    subtitle: '测试用例'
                  );
                  jPush.sendLocalNotification(localNotification).then((res){
                    setState(() {
                      debugLabel=res;
                    });
                  });
                },
              )
            ],
          ),
        )
    );
  }
}
