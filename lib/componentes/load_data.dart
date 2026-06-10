import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/playlists.dart';

class LoadData {
  

  static Future<void> save(Playlists playlists) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'playlists',
      jsonEncode(playlists.toJson()),
    );
  }

  static Future<Playlists> load() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString('playlists');

    if (jsonString == null) {
      return Playlists();
    }

    return Playlists.fromJson(
      jsonDecode(jsonString),
    );
  }
}