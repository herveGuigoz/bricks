import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  Future<bool> _requestPermission(Permission permission) async {
    if (await hasPermission(permission)) return true;
    final result = await [permission].request();
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  Future<bool> hasPermission(Permission permission) async {
    final status = await permission.status;

    return status == PermissionStatus.granted;
  }

  /// Requests the users permission to access media storage
  Future<bool> requestStoragePermission() async {
    return _requestPermission(Permission.storage);
  }
}