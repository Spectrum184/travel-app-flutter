import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageHelper {
  LocalStorageHelper._internal();
  static final LocalStorageHelper _shared = LocalStorageHelper._internal();
  Box<dynamic>? hiveBox;

  factory LocalStorageHelper() {
    return _shared;
  }

  static intiLocalStorage() async {
    _shared.hiveBox = await Hive.openBox("TravelApp");
  }

  static dynamic getValue(String key) {
    return _shared.hiveBox?.get(key);
  }

  static setValue(String key, dynamic val) {
    _shared.hiveBox?.put(key, val);
  }
}
