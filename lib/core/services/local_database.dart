import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager/core/utils/enums.dart';

import '../utils/extensions.dart';

final localDbProvider = Provider<LocalDbHelper>((_) {
  return LocalDbHelper();
});

class LocalDbHelper {
  Database? _database;
  static const _databaseName = "task_flow.db";
  static const _databaseVersion = 1;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    return await openDatabase(
      _databaseName,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE profile (
      user_uid TEXT PRIMARY KEY,
      email TEXT NOT NULL,
      name TEXT,
      last_sync INTEGER,              -- timestamp in ms (UTC)
      theme_mode TEXT,                -- enum: "light", "dark", "system"
      language_pref TEXT              -- enum: "enUS", "hiIN", etc.
      );'''
    );

    await db.execute('''CREATE TABLE tasks (
      task_id TEXT PRIMARY KEY,       -- eg: task_uuid
      user_uid TEXT NOT NULL,          -- FK → profile(user_uid)

      title TEXT NOT NULL,
      description TEXT,
      due_date INTEGER,               -- timestamp (ms)
      priority TEXT DEFAULT 'Medium', -- enum: "Low", "Medium", "High"
      completed INTEGER NOT NULL DEFAULT 0,  -- bool (0/1)
      updated_at INTEGER NOT NULL,    -- timestamp (ms)
      created_at INTEGER NOT NULL,    -- timestamp (ms)
      is_deleted INTEGER NOT NULL DEFAULT 0, -- soft delete (0/1)

      FOREIGN KEY (user_uid) REFERENCES profile(user_uid) ON DELETE CASCADE
      );''');

    await db.execute('''CREATE TABLE attachments (
      attachment_id TEXT PRIMARY KEY, -- eg: attachment_uuid
      task_id TEXT NOT NULL,          -- FK → tasks(task_id)
      user_uid TEXT NOT NULL,          -- FK → profile(user_uid)

      remote_url TEXT,                -- Supabase storage URL
      file_name TEXT,                 -- original filename
      mime_type TEXT,                 -- image/png, application/pdf
      downloaded_path TEXT,           -- local cached path

      updated_at INTEGER NOT NULL,    -- timestamp (ms)
      is_deleted INTEGER NOT NULL DEFAULT 0,

      FOREIGN KEY (task_id) REFERENCES tasks(task_id) ON DELETE CASCADE,
      FOREIGN KEY (user_uid) REFERENCES profile(user_uid) ON DELETE CASCADE
      );''');

    // 1. Create the table first
    await db.execute('''CREATE TABLE pending_operations (
      pending_operations_id TEXT PRIMARY KEY,  -- eg:pendOps_uuid

      entity_type TEXT NOT NULL,      -- "TASK", "ATTACHMENT", "PROFILE"
      entity_id TEXT NOT NULL,        -- uuid from respective table

      operation_type TEXT NOT NULL,        -- enum: "CREATE", "UPDATE", "DELETE"
        
      user_id TEXT NOT NULL,          

      retry_count INTEGER DEFAULT 0,
      error_message TEXT,

      status TEXT DEFAULT 'PENDING',  -- enum: "PENDING", "SUCCESS", "FAILED"

      created_at INTEGER NOT NULL,    -- timestamp (ms)
      processed_at INTEGER            -- nullable
      );''');

    // 2. Create the index in a separate statement
    await db.execute('''CREATE INDEX idx_pending_entity_id 
      ON pending_operations(entity_id);''');
  }

  Future<ThemeMode> getThemeMode() async {
    final db = await database;

    List<Map> maps = await db.query('profile',
        columns: ["theme_mode"]);

    if (maps.isNotEmpty) {
      return EnumDb.fromDb(ThemeMode.values, maps.first["theme_mode"]);
  }
    return ThemeMode.system;
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    String themeModeStr = EnumDb.toDb(themeMode);
    final db = await database;

    db.rawInsert('INSERT INTO profile(theme_mode) VALUES($themeModeStr)');
  }
}
