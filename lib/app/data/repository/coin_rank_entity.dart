import 'package:wan/generated/json/base/json_convert_content.dart';

class CoinRankEntity with JsonConvert<CoinRankEntity> {
	int? curPage;
	List<CoinRankDatas>? datas;
	int? offset;
	bool? over;
	int? pageCount;
	int? size;
	int? total;
}

class CoinRankDatas with JsonConvert<CoinRankDatas> {
	int? coinCount;
	int? level;
	String? nickname;
	String? rank;
	int? userId;
	String? username;
}
