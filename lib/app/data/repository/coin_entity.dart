import 'package:wan/generated/json/base/json_convert_content.dart';

class CoinEntity with JsonConvert<CoinEntity> {
	int? coinCount;
	int? rank;
	int? userId;
	String? username;
}
