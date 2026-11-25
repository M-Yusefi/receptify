import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _FavoriteMeals =
          prefs.getStringList('ff_FavoriteMeals') ?? _FavoriteMeals;
    });
    _safeInit(() {
      _hasSeenOnboarding =
          prefs.getBool('ff_hasSeenOnboarding') ?? _hasSeenOnboarding;
    });
    _safeInit(() {
      _FavoriteMeals1 = prefs
              .getStringList('ff_FavoriteMeals1')
              ?.map((x) {
                try {
                  return FavoriteMealsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _FavoriteMeals1;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _FavoriteMeals = [];
  List<String> get FavoriteMeals => _FavoriteMeals;
  set FavoriteMeals(List<String> value) {
    _FavoriteMeals = value;
    prefs.setStringList('ff_FavoriteMeals', value);
  }

  void addToFavoriteMeals(String value) {
    FavoriteMeals.add(value);
    prefs.setStringList('ff_FavoriteMeals', _FavoriteMeals);
  }

  void removeFromFavoriteMeals(String value) {
    FavoriteMeals.remove(value);
    prefs.setStringList('ff_FavoriteMeals', _FavoriteMeals);
  }

  void removeAtIndexFromFavoriteMeals(int index) {
    FavoriteMeals.removeAt(index);
    prefs.setStringList('ff_FavoriteMeals', _FavoriteMeals);
  }

  void updateFavoriteMealsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    FavoriteMeals[index] = updateFn(_FavoriteMeals[index]);
    prefs.setStringList('ff_FavoriteMeals', _FavoriteMeals);
  }

  void insertAtIndexInFavoriteMeals(int index, String value) {
    FavoriteMeals.insert(index, value);
    prefs.setStringList('ff_FavoriteMeals', _FavoriteMeals);
  }

  bool _hasSeenOnboarding = false;
  bool get hasSeenOnboarding => _hasSeenOnboarding;
  set hasSeenOnboarding(bool value) {
    _hasSeenOnboarding = value;
    prefs.setBool('ff_hasSeenOnboarding', value);
  }

  List<FavoriteMealsStruct> _FavoriteMeals1 = [];
  List<FavoriteMealsStruct> get FavoriteMeals1 => _FavoriteMeals1;
  set FavoriteMeals1(List<FavoriteMealsStruct> value) {
    _FavoriteMeals1 = value;
    prefs.setStringList(
        'ff_FavoriteMeals1', value.map((x) => x.serialize()).toList());
  }

  void addToFavoriteMeals1(FavoriteMealsStruct value) {
    FavoriteMeals1.add(value);
    prefs.setStringList('ff_FavoriteMeals1',
        _FavoriteMeals1.map((x) => x.serialize()).toList());
  }

  void removeFromFavoriteMeals1(FavoriteMealsStruct value) {
    FavoriteMeals1.remove(value);
    prefs.setStringList('ff_FavoriteMeals1',
        _FavoriteMeals1.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFavoriteMeals1(int index) {
    FavoriteMeals1.removeAt(index);
    prefs.setStringList('ff_FavoriteMeals1',
        _FavoriteMeals1.map((x) => x.serialize()).toList());
  }

  void updateFavoriteMeals1AtIndex(
    int index,
    FavoriteMealsStruct Function(FavoriteMealsStruct) updateFn,
  ) {
    FavoriteMeals1[index] = updateFn(_FavoriteMeals1[index]);
    prefs.setStringList('ff_FavoriteMeals1',
        _FavoriteMeals1.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFavoriteMeals1(int index, FavoriteMealsStruct value) {
    FavoriteMeals1.insert(index, value);
    prefs.setStringList('ff_FavoriteMeals1',
        _FavoriteMeals1.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
