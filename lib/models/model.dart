// ignore_for_file: non_constant_identifier_names, camel_case_types, file_namesimport, file_names, unnecessary_null_comparison

// WARNING: This code is auto-generated by Supadart.
// WARNING: Modifications may be overwritten. Please make changes in the SudaDart configuration.

// SDK
import 'package:supabase_flutter/supabase_flutter.dart';

// No Intl package needed
// No Dart Convert needed
// Supadart Class
abstract class SupadartClass<T> {
  static Map<String, dynamic> insert(Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  static Map<String, dynamic> update(Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  factory SupadartClass.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  static converter(List<Map<String, dynamic>> data) {
    throw UnimplementedError();
  }

  static converterSingle(Map<String, dynamic> data) {
    throw UnimplementedError();
  }
}

// Supabase Client Extension
extension SupadartClient on SupabaseClient {
  SupabaseQueryBuilder get player_dashboard => from('player_dashboard');
  SupabaseQueryBuilder get player_history => from('player_history');
  SupabaseQueryBuilder get player => from('player');
}

// Supabase Storage Client Extension
extension SupadartStorageClient on SupabaseStorageClient {}

// Enums

// Utils
class PlayerDashboard implements SupadartClass<PlayerDashboard> {
  final String? id;
  final String? name;
  final int? score;

  const PlayerDashboard({
    this.id,
    this.name,
    this.score,
  });

  static String get table_name => 'player_dashboard';
  static String get c_id => 'id';
  static String get c_name => 'name';
  static String get c_score => 'score';

  static List<PlayerDashboard> converter(List<Map<String, dynamic>> data) {
    return data.map(PlayerDashboard.fromJson).toList();
  }

  static PlayerDashboard converterSingle(Map<String, dynamic> data) {
    return PlayerDashboard.fromJson(data);
  }

  static Map<String, dynamic> _generateMap({
    String? id,
    String? name,
    int? score,
  }) {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (score != null) 'score': score,
    };
  }

  static Map<String, dynamic> insert({
    String? id,
    String? name,
    int? score,
  }) {
    return _generateMap(
      id: id,
      name: name,
      score: score,
    );
  }

  static Map<String, dynamic> update({
    String? id,
    String? name,
    int? score,
  }) {
    return _generateMap(
      id: id,
      name: name,
      score: score,
    );
  }

  factory PlayerDashboard.fromJson(Map<String, dynamic> jsonn) {
    return PlayerDashboard(
      id: jsonn['id'] != null ? jsonn['id'].toString() : '',
      name: jsonn['name'] != null ? jsonn['name'].toString() : '',
      score: jsonn['score'] != null ? int.parse(jsonn['score'].toString()) : 0,
    );
  }

  Map<String, dynamic> toJson() {
    return _generateMap(
      id: id,
      name: name,
      score: score,
    );
  }

  PlayerDashboard copyWith({
    String? id,
    String? name,
    int? score,
  }) {
    return PlayerDashboard(
      id: id ?? this.id,
      name: name ?? this.name,
      score: score ?? this.score,
    );
  }

  // @override
  // int compareTo(final other) {
  //   return score! > other.score ? -1 : 1;
  //   // throw UnimplementedError();
  // }
}

class PlayerHistory implements SupadartClass<PlayerHistory> {
  final String id;
  final DateTime createdAt;
  final int score;
  final int resumeFrom;
  final String playerId;

  const PlayerHistory({
    required this.id,
    required this.createdAt,
    required this.score,
    required this.resumeFrom,
    required this.playerId,
  });

  static String get table_name => 'player_history';
  static String get c_id => 'id';
  static String get c_createdAt => 'created_at';
  static String get c_score => 'score';
  static String get c_resumeFrom => 'resume_from';
  static String get c_playerId => 'player_id';

  static List<PlayerHistory> converter(List<Map<String, dynamic>> data) {
    return data.map(PlayerHistory.fromJson).toList();
  }

  static PlayerHistory converterSingle(Map<String, dynamic> data) {
    return PlayerHistory.fromJson(data);
  }

  static Map<String, dynamic> _generateMap({
    String? id,
    DateTime? createdAt,
    int? score,
    int? resumeFrom,
    String? playerId,
  }) {
    return {
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt.toUtc().toIso8601String(),
      if (score != null) 'score': score,
      if (resumeFrom != null) 'resume_from': resumeFrom,
      if (playerId != null) 'player_id': playerId,
    };
  }

  static Map<String, dynamic> insert({
    String? id,
    DateTime? createdAt,
    required int score,
    required int resumeFrom,
    required String playerId,
  }) {
    return _generateMap(
      id: id,
      createdAt: createdAt,
      score: score,
      resumeFrom: resumeFrom,
      playerId: playerId,
    );
  }

  static Map<String, dynamic> update({
    String? id,
    DateTime? createdAt,
    int? score,
    int? resumeFrom,
    String? playerId,
  }) {
    return _generateMap(
      id: id,
      createdAt: createdAt,
      score: score,
      resumeFrom: resumeFrom,
      playerId: playerId,
    );
  }

  factory PlayerHistory.fromJson(Map<String, dynamic> jsonn) {
    return PlayerHistory(
      id: jsonn['id'] != null ? jsonn['id'].toString() : '',
      createdAt: jsonn['created_at'] != null
          ? DateTime.parse(jsonn['created_at'].toString())
          : DateTime.fromMillisecondsSinceEpoch(0),
      score: jsonn['score'] != null ? int.parse(jsonn['score'].toString()) : 0,
      resumeFrom: jsonn['resume_from'] != null
          ? int.parse(jsonn['resume_from'].toString())
          : 0,
      playerId: jsonn['player_id'] != null ? jsonn['player_id'].toString() : '',
    );
  }

  Map<String, dynamic> toJson() {
    return _generateMap(
      id: id,
      createdAt: createdAt,
      score: score,
      resumeFrom: resumeFrom,
      playerId: playerId,
    );
  }

  PlayerHistory copyWith({
    String? id,
    DateTime? createdAt,
    int? score,
    int? resumeFrom,
    String? playerId,
  }) {
    return PlayerHistory(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      score: score ?? this.score,
      resumeFrom: resumeFrom ?? this.resumeFrom,
      playerId: playerId ?? this.playerId,
    );
  }
}

class Player implements SupadartClass<Player> {
  final String id;
  final DateTime createdAt;
  final String name;

  const Player({
    required this.id,
    required this.createdAt,
    required this.name,
  });

  static String get table_name => 'player';
  static String get c_id => 'id';
  static String get c_createdAt => 'created_at';
  static String get c_name => 'name';

  static List<Player> converter(List<Map<String, dynamic>> data) {
    return data.map(Player.fromJson).toList();
  }

  static Player converterSingle(Map<String, dynamic> data) {
    return Player.fromJson(data);
  }

  static Map<String, dynamic> _generateMap({
    String? id,
    DateTime? createdAt,
    String? name,
  }) {
    return {
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt.toUtc().toIso8601String(),
      if (name != null) 'name': name,
    };
  }

  static Map<String, dynamic> insert({
    String? id,
    DateTime? createdAt,
    String? name,
  }) {
    return _generateMap(
      id: id,
      createdAt: createdAt,
      name: name,
    );
  }

  static Map<String, dynamic> update({
    String? id,
    DateTime? createdAt,
    String? name,
  }) {
    return _generateMap(
      id: id,
      createdAt: createdAt,
      name: name,
    );
  }

  factory Player.fromJson(Map<String, dynamic> jsonn) {
    return Player(
      id: jsonn['id'] != null ? jsonn['id'].toString() : '',
      createdAt: jsonn['created_at'] != null
          ? DateTime.parse(jsonn['created_at'].toString())
          : DateTime.fromMillisecondsSinceEpoch(0),
      name: jsonn['name'] != null ? jsonn['name'].toString() : '',
    );
  }

  Map<String, dynamic> toJson() {
    return _generateMap(
      id: id,
      createdAt: createdAt,
      name: name,
    );
  }

  Player copyWith({
    String? id,
    DateTime? createdAt,
    String? name,
  }) {
    return Player(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
    );
  }
}
