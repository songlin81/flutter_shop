import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttershop/routers/application.dart';

class CustomModalDialogsWithImage {

  void showCustomDialogWithImage(BuildContext context, String message) {
    Dialog dialogWithImage = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 320.0,
        width: 400.0,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 200,
              width: 300,
              child:
              Image.network(
                'http://tvax3.sinaimg.cn/crop.37.0.958.958.180/68754f53ly8fq51134oj3j20sp0sp0y3.jpg',
                fit: BoxFit.scaleDown,
                height: 180,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(200),
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Application.router.navigateTo(context, "/jg");
                    },
                    child: Text(
                      'Okay',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: ScreenUtil().setWidth(200),
                  child: RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) => dialogWithImage);
    }
}