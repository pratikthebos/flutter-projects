import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/report_model.dart';

class DatabaseService {
  DatabaseService._();

  static final DatabaseService instance = DatabaseService._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, 'pe_test_report.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE reports(
        id TEXT PRIMARY KEY,
        testerName TEXT,
        platform TEXT,
        deviceName TEXT,
        osVersion TEXT,
        appVersion TEXT,
        buildNumber TEXT,
        testingDate TEXT,
        testcases TEXT
      )
    ''');
  }

  /// Insert Report
  Future<void> insertReport(ReportModel report) async {
    final db = await database;

    await db.insert(
      'reports',
      report.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Get All Reports
  Future<List<ReportModel>> getReports() async {
    final db = await database;

    final result = await db.query(
      'reports',
      orderBy: 'testingDate DESC',
    );

    return result
        .map((e) => ReportModel.fromMap(e))
        .toList();
  }

  /// Get Single Report
  Future<ReportModel?> getReport(String id) async {
    final db = await database;

    final result = await db.query(
      'reports',
      where: 'id=?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isEmpty) return null;

    return ReportModel.fromMap(result.first);
  }

  /// Update Report
  Future<void> updateReport(ReportModel report) async {
    final db = await database;

    await db.update(
      'reports',
      report.toMap(),
      where: 'id=?',
      whereArgs: [report.id],
    );
  }

  /// Delete Report
  Future<void> deleteReport(String id) async {
    final db = await database;

    await db.delete(
      'reports',
      where: 'id=?',
      whereArgs: [id],
    );
  }

  /// Total Reports
  Future<int> totalReports() async {
    final db = await database;

    final result =
    await db.rawQuery('SELECT COUNT(*) as total FROM reports');

    return Sqflite.firstIntValue(result) ?? 0;
  }

  /// Clear Database
  Future<void> clearDatabase() async {
    final db = await database;

    await db.delete('reports');
  }
}