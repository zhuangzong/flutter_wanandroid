import 'package:wan/generated/json/base/json_convert_content.dart';

class HotkeyEntity with JsonConvert<HotkeyEntity> {
	int? id;
	String? link;
	String? name;
	int? order;
	int? visible;
}
