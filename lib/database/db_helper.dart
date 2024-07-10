import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mychat/model/message_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;

  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'messages.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE messages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT,
        sender TEXT
      )
    ''');
  }

  Future<void> insertMessage(Message message) async {
    final db = await database;
    await db.insert(
      'messages',
      message.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Message>> getMessages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('messages');
    return List.generate(maps.length, (i) {
      return Message(
        id: maps[i]['id'],
        text: maps[i]['text'],
        sender: maps[i]['sender'],
      );
    });
  }

  Future<void> updateMessage(Message message) async {
    final db = await database;
    await db.update(
      'messages',
      message.toMap(),
      where: 'id = ?',
      whereArgs: [message.id],
    );
  }

  Future<void> deleteMessage(int id) async {
    final db = await database;
    await db.delete(
      'messages',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
