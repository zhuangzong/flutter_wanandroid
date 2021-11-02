import 'package:wan/generated/json/base/json_convert_content.dart';

class CoinListEntity with JsonConvert<CoinListEntity> {
	int? curPage;
	List<CoinListDatas>? datas;
	int? offset;
	bool? over;
	int? pageCount;
	int? size;
	int? total;
}

class CoinListDatas with JsonConvert<CoinListDatas> {
	int? coinCount;
	int? date;
	String? desc;
	int? id;
	String? reason;
	int? type;
	int? userId;
	String? userName;
}
