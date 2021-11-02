// ignore_for_file: file_names

import 'dart:convert';


import 'package:wan/network/bean/result_entity.dart';

import '../../entity_factory.dart';
import '../api.dart';
import 'Transform.dart';

class ApiFullTransform<T> extends ResponseTransform<T>{
  ApiFullTransform() : super();

  @override
  void apply(String data) {

    int errorCode = json.decode(data)["errorCode"];
    String errorMsg = json.decode(data)["errorMsg"];

    if (errorCode != 0) {
      callError(
        MyError(10, "请求失败："+errorMsg),
      );
    } else {
      add(EntityFactory.generateOBJ<T>(json.decode(data.toString()))!);
    }

  }
}