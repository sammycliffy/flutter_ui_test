import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastResp {
  static toastMsgError({String? resp}) {
    return Fluttertoast.showToast(
        timeInSecForIosWeb: 4,
        msg: resp.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 11.dp);
  }

  static toastMsgSuccess({String? resp}) {
    return Fluttertoast.showToast(
        timeInSecForIosWeb: 4,
        msg: resp.toString(),
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 11.dp);
  }
}
