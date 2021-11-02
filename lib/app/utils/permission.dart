import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static requestPermission() async {
    // 请求权限
    Map<Permission, PermissionStatus> permissions = await [
      Permission.storage,
      Permission.camera,
      Permission.location
    ].request();
    if (permissions[Permission.storage] != PermissionStatus.granted) {
      print("无存储权限");
    }
    //校验权限
    if (permissions[Permission.camera] != PermissionStatus.granted) {
      print("无照相权限");
    }
    if (permissions[Permission.location] != PermissionStatus.granted) {
      print("无定位权限");
    }
//    bool isOpened = await PermissionHandler().openAppSettings();
  }
}
