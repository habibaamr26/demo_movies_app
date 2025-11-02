
import 'package:hive/hive.dart';
import 'package:week6_task/config/cashing/cashing_constant.dart';

class HiveCache {
  static final HiveCache instance = HiveCache._internal();
  factory HiveCache() => instance;
  HiveCache._internal();

  static Box? _box;

  static Future<void> init() async {
    _box ??= await Hive.openBox(CashingConstants.hiveBox);
  }

  Future<void> addData(String key, dynamic value) async {
    await _box?.put(key, value);
  }

  T? getData<T>(String key) {
    return _box!.get(key) as T?;
  }

 
  Future<void> deleteData(String key) async {
    await _box!.delete(key);
  }

  Future<void> clearAll() async {
    await _box!.clear();
  }

  bool containsKey(String key) {
    return _box!.containsKey(key);
  }

  Future<void> close() async {
    await _box?.close();
  }
}
