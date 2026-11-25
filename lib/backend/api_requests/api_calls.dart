import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Color, DateTimeRange;
// Redundant when the data-type schema export already re-exports it.
// ignore: unnecessary_import
import 'package:from_css_color/from_css_color.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchRecipeCall {
  static Future<ApiCallResponse> call({
    String? searchQuery = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SearchRecipe',
      apiUrl: 'www.themealdb.com/api/json/v1/1/search.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        's': searchQuery,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? meals(dynamic response) => getJsonField(
        response,
        r'''$.meals''',
        true,
      ) as List?;
  static List<String>? idMeal(dynamic response) => (getJsonField(
        response,
        r'''$.meals[:].idMeal''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.meals[:].strMeal''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? category(dynamic response) => (getJsonField(
        response,
        r'''$.meals[:].strCategory''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? area(dynamic response) => (getJsonField(
        response,
        r'''$.meals[:].strArea''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? country(dynamic response) => (getJsonField(
        response,
        r'''$.meals[:].strCountry''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? instractions(dynamic response) => (getJsonField(
        response,
        r'''$.meals[:].strInstructions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.meals[:].strMealThumb''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RecipeLookupCall {
  static Future<ApiCallResponse> call({
    String? recipeId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'RecipeLookup',
      apiUrl: 'www.themealdb.com/api/json/v1/1/lookup.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'i': recipeId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].idMeal''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeal''',
      ));
  static String? category(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strCategory''',
      ));
  static String? area(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strArea''',
      ));
  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strCountry''',
      ));
  static String? instructions(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strInstructions''',
      ));
  static String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMealThumb''',
      ));
  static String? tags(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strTags''',
      ));
  static String? youtube(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strYoutube''',
      ));
  static String? in1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient1''',
      ));
  static String? ms1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure1''',
      ));
  static String? in2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient2''',
      ));
  static String? ms2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure2''',
      ));
  static String? in3(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient3''',
      ));
  static String? ms3(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure3''',
      ));
  static String? in4(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient4''',
      ));
  static String? ms4(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure4''',
      ));
  static String? in5(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient5''',
      ));
  static String? ms5(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure5''',
      ));
  static String? in6(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient6''',
      ));
  static String? ms6(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure6''',
      ));
  static String? in7(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient7''',
      ));
  static String? ms7(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure7''',
      ));
  static String? in8(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient8''',
      ));
  static String? ms8(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure8''',
      ));
  static String? in9(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient9''',
      ));
  static String? ms9(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure9''',
      ));
  static String? in10(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient10''',
      ));
  static String? ms10(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure10''',
      ));
  static String? in11(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient11''',
      ));
  static String? ms11(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure11''',
      ));
  static String? in12(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient12''',
      ));
  static String? ms12(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure12''',
      ));
  static String? in13(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient13''',
      ));
  static String? ms13(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure13''',
      ));
  static String? in14(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient14''',
      ));
  static String? ms14(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure14''',
      ));
  static String? in15(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient15''',
      ));
  static String? ms15(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure15''',
      ));
  static String? in16(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient16''',
      ));
  static String? ms16(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure16''',
      ));
  static String? in17(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient17''',
      ));
  static String? ms17(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure17''',
      ));
  static String? in18(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient18''',
      ));
  static String? ms18(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure18''',
      ));
  static String? in19(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strIngredient19''',
      ));
  static String? ms19(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strMeasure19''',
      ));
  static String? source(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].strSource''',
      ));
}

class CategoryCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Category',
      apiUrl: 'https://www.themealdb.com/api/json/v1/1/list.php?c=list',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? categories(dynamic response) => (getJsonField(
        response,
        r'''$.meals[:].strCategory''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class IngredientsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Ingredients ',
      apiUrl: 'https://www.themealdb.com/api/json/v1/1/list.php?i=list',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? ingredients(dynamic response) => (getJsonField(
        response,
        r'''$.meals[:].strIngredient''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RandomCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Random',
      apiUrl: 'https://www.themealdb.com/api/json/v1/1/random.php',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? idMeal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meals[:].idMeal''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DateTime) {
    return item.toIso8601String();
  }
  if (item is Color) {
    return item.toCssString();
  }
  if (item is LatLng) {
    return item.serialize();
  }
  if (item is DateTimeRange) {
    String millis(DateTime d) =>
        '${d.isUtc ? 'u' : 'l'}${d.millisecondsSinceEpoch}';
    return '${millis(item.start)}|${millis(item.end)}';
  }
  if (item is FFPlace) {
    return jsonEncode({
      'latLng': item.latLng.serialize(),
      'name': item.name,
      'address': item.address,
      'city': item.city,
      'state': item.state,
      'country': item.country,
      'zipCode': item.zipCode,
    });
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
