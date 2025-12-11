import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager/core/utils/enums.dart';

import '../utils/extensions.dart';

final Provider<LocalDatabaseService> localDbProvider =
    Provider<LocalDatabaseService>((_) {
      return LocalDatabaseService();
    });

class LocalDatabaseService {
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
    // Note: We keep table names hardcoded in SQL for clarity,
    // but they match Tables.x.tableName.
    await db.execute('''CREATE TABLE ${Tables.profile.name} (
      user_uid TEXT PRIMARY KEY,
      email TEXT NOT NULL,
      name TEXT,
      authProvider TEXT               -- enum: "google", "apple", "guest", "email"
      last_sync INTEGER,              -- timestamp in ms (UTC)
      theme_mode TEXT,                -- enum: "light", "dark", "system"
      language_pref TEXT              -- enum: "enUS", "hiIN", etc.
      );''');

    await db.execute('''CREATE TABLE ${Tables.tasks.name} (
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

      FOREIGN KEY (user_uid) REFERENCES ${Tables.profile.name}(user_uid) ON DELETE CASCADE
      );''');

    await db.execute('''CREATE TABLE ${Tables.attachments.name} (
      attachment_id TEXT PRIMARY KEY, -- eg: attachment_uuid
      task_id TEXT NOT NULL,          -- FK → tasks(task_id)
      user_uid TEXT NOT NULL,          -- FK → profile(user_uid)

      remote_url TEXT,                -- Supabase storage URL
      file_name TEXT,                 -- original filename
      mime_type TEXT,                 -- image/png, application/pdf
      downloaded_path TEXT,           -- local cached path

      updated_at INTEGER NOT NULL,    -- timestamp (ms)
      is_deleted INTEGER NOT NULL DEFAULT 0,

      FOREIGN KEY (task_id) REFERENCES ${Tables.tasks.name}(task_id) ON DELETE CASCADE,
      FOREIGN KEY (user_uid) REFERENCES ${Tables.profile.name}(user_uid) ON DELETE CASCADE
      );''');

    // 1. Create the table first
    await db.execute('''CREATE TABLE ${Tables.pendingOperations.name} (
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
      ON ${Tables.pendingOperations.name}(entity_id);''');
  }

  Future<ThemeMode> getThemeMode() async {
    final db = await database;

    List<Map<String, dynamic>> maps = await db.query(
      Tables.profile.name,
      columns: ["theme_mode"],
    );

    if (maps.isNotEmpty && maps.first["theme_mode"] != null) {
      return EnumDbExt.fromDb(ThemeMode.values, maps.first["theme_mode"]);
    }
    return ThemeMode.system;
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    String themeModeStr = EnumDbExt.toDb(themeMode);
    final db = await database;

    await db.update(Tables.profile.name, {'theme_mode': themeModeStr});
  }
}
