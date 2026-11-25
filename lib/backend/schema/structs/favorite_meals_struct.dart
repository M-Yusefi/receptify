// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoriteMealsStruct extends BaseStruct {
  FavoriteMealsStruct({
    String? idMeal,
    String? strMeal,
    String? strMealThumb,
    String? strCategory,
    String? strArea,
  })  : _idMeal = idMeal,
        _strMeal = strMeal,
        _strMealThumb = strMealThumb,
        _strCategory = strCategory,
        _strArea = strArea;

  // "idMeal" field.
  String? _idMeal;
  String get idMeal => _idMeal ?? '';
  set idMeal(String? val) => _idMeal = val;

  bool hasIdMeal() => _idMeal != null;

  // "strMeal" field.
  String? _strMeal;
  String get strMeal => _strMeal ?? '';
  set strMeal(String? val) => _strMeal = val;

  bool hasStrMeal() => _strMeal != null;

  // "strMealThumb" field.
  String? _strMealThumb;
  String get strMealThumb => _strMealThumb ?? '';
  set strMealThumb(String? val) => _strMealThumb = val;

  bool hasStrMealThumb() => _strMealThumb != null;

  // "strCategory" field.
  String? _strCategory;
  String get strCategory => _strCategory ?? '';
  set strCategory(String? val) => _strCategory = val;

  bool hasStrCategory() => _strCategory != null;

  // "strArea" field.
  String? _strArea;
  String get strArea => _strArea ?? '';
  set strArea(String? val) => _strArea = val;

  bool hasStrArea() => _strArea != null;

  static FavoriteMealsStruct fromMap(Map<String, dynamic> data) =>
      FavoriteMealsStruct(
        idMeal: data['idMeal'] as String?,
        strMeal: data['strMeal'] as String?,
        strMealThumb: data['strMealThumb'] as String?,
        strCategory: data['strCategory'] as String?,
        strArea: data['strArea'] as String?,
      );

  static FavoriteMealsStruct? maybeFromMap(dynamic data) => data is Map
      ? FavoriteMealsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'idMeal': _idMeal,
        'strMeal': _strMeal,
        'strMealThumb': _strMealThumb,
        'strCategory': _strCategory,
        'strArea': _strArea,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idMeal': serializeParam(
          _idMeal,
          ParamType.String,
        ),
        'strMeal': serializeParam(
          _strMeal,
          ParamType.String,
        ),
        'strMealThumb': serializeParam(
          _strMealThumb,
          ParamType.String,
        ),
        'strCategory': serializeParam(
          _strCategory,
          ParamType.String,
        ),
        'strArea': serializeParam(
          _strArea,
          ParamType.String,
        ),
      }.withoutNulls;

  static FavoriteMealsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FavoriteMealsStruct(
        idMeal: deserializeParam(
          data['idMeal'],
          ParamType.String,
          false,
        ),
        strMeal: deserializeParam(
          data['strMeal'],
          ParamType.String,
          false,
        ),
        strMealThumb: deserializeParam(
          data['strMealThumb'],
          ParamType.String,
          false,
        ),
        strCategory: deserializeParam(
          data['strCategory'],
          ParamType.String,
          false,
        ),
        strArea: deserializeParam(
          data['strArea'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FavoriteMealsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FavoriteMealsStruct &&
        idMeal == other.idMeal &&
        strMeal == other.strMeal &&
        strMealThumb == other.strMealThumb &&
        strCategory == other.strCategory &&
        strArea == other.strArea;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([idMeal, strMeal, strMealThumb, strCategory, strArea]);
}

FavoriteMealsStruct createFavoriteMealsStruct({
  String? idMeal,
  String? strMeal,
  String? strMealThumb,
  String? strCategory,
  String? strArea,
}) =>
    FavoriteMealsStruct(
      idMeal: idMeal,
      strMeal: strMeal,
      strMealThumb: strMealThumb,
      strCategory: strCategory,
      strArea: strArea,
    );
