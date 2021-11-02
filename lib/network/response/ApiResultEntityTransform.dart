import 'dart:convert';


import 'package:wan/network/bean/result_entity.dart';

import 'Transform.dart';


class ApiStringTransform extends ResponseTransform<ResultEntity>{


  @override
  void apply(String data) {
    //直接返回 string
    add(ResultEntity.fromJson(jsonDecode(data.toString())));
  }

}