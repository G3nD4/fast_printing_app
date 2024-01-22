import 'dart:convert';

import 'package:fast_printing_app/domain/service/db_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseSPRepository<T> implements DatabaseInterface {
  static final DatabaseSPRepository _databaseRepository = DatabaseSPRepository._();

  DatabaseSPRepository._();

  factory DatabaseSPRepository() => _databaseRepository as DatabaseSPRepository<T>;

  SharedPreferences get _database {
    if (_prefs == null) {
      throw Exception('Database not initialized! Please, call init() first.');
    } else {
      return _prefs!;
    }
  }

  String get idKey => 'id_key';
  SharedPreferences? _prefs;

  @override
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  @override
  String get databaseName => "leaderboard_db";

  @override
  List<T> fetchAll() {
    Set<String> ids = _database.getKeys();
    List<T> models = [];
    for (String id in ids) {
      models.add(_database.get(id) as T);
    }

    return models;
  }

  @override
  String getAvailableId() {
    return _database.getString(idKey) ?? '0';
  }

  @override
  T getById(String id) {
    return _database.get(id) as T;
  }

  @override
  void insert(String key, Map<String, dynamic> jsonModel) {
    _database.setString(key, jsonEncode(jsonModel));
  }
}