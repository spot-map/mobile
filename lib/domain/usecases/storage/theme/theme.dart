import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_map/domain/storage/theme.dart';

class ThemeStorageUseCaseImpl implements ThemeStorage {
  static const String _boxName = 'ThemeStorage';
  static const String _key = 'theme';

  static Future initHive() async {
    return Hive.openBox<bool?>(_boxName);
  }

  final _hiveBox = Hive.box<bool?>(_boxName);

  @override
  bool? get theme => _hiveBox.get(_key);

  @override
  set theme(bool? value) => _hiveBox.put(_key, value);
}
