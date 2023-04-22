import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'Park.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyParks = 'parks';
  
  static Future setParks(List<Park> parks) async {
    final value = jsonEncode(parks);
    await _storage.write(key: _keyParks, value: value);
  }
  
  static Future<List<Park>?> getParks() async {
    final String? value = await _storage.read(key: _keyParks);
    List<Park> parks = [];
    if(value != null) {
      Map<String, dynamic> jsonMap = jsonDecode(value);
      jsonMap.forEach((key, value) {
        parks.add(
          Park.fromJson(json)
        )
      })
    }

    return value == null ? null : List<Park>.from(jsonDecode(value));
  }
}