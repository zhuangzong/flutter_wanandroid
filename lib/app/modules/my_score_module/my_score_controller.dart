import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wan/app/data/repository/coin_entity.dart';
import 'package:wan/app/data/repository/coin_list_entity.dart';
import 'package:wan/app/data/repository/coin_rank_entity.dart';
import 'package:wan/app/utils/requestUtil.dart';
import 'package:wan/network/bean/result_entity.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MyScoreController extends GetxController{

  var coin = 0.obs;
  var coinList = [].obs;
  var coinRank = [].obs;
  var pageIndex = 1;
  ScrollController scrollController = ScrollController();
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getCoin();
    getCoinRank();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageIndex++;
        print(pageIndex);
        getCoinRank();
      }
    });
  }

  void getCoin() async{
    ResultEntity resultEntity = await RequestUtils.coin();
    CoinEntity coinEntity = CoinEntity().fromJson(resultEntity.data);
    coin.value = coinEntity.coinCount!;

    ResultEntity resultEntityList = await RequestUtils.coinList();
    CoinListEntity coinListEntity = CoinListEntity().fromJson(resultEntityList.data);
    coinList.addAll(coinListEntity.datas!.obs);
  }

  void getCoinRank() async{
    ResultEntity resultEntityRank = await RequestUtils.coinRank(pageIndex);
    CoinRankEntity coinRankEntity = CoinRankEntity().fromJson(resultEntityRank.data);
    coinRank.addAll(coinRankEntity.datas!.obs);
  }

}
