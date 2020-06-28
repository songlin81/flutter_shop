import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttershop/routers/application.dart';

class CustomModalDialogs {

  void showSimpleCustomDialog(BuildContext context, String message) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                message,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                child: Row(
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
                      ),
                    )
                  ],
              ),
            ),
          ],
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) => simpleDialog
    );
  }

}