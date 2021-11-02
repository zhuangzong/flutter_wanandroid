





import 'Transform.dart';

class ApiStringTransform extends ResponseTransform<String>{


  @override
  void apply(String data) {
    //直接返回 string
    add(data);
  }

}