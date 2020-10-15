import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:get/get.dart';

abstract class ViewStateLess<T extends Controller> extends GetView<T> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: buildPage(), onWillPop: willPopCallBack);
  }

  Widget buildPage();

  Future<bool> willPopCallBack() async {
    return true;
  }
}
