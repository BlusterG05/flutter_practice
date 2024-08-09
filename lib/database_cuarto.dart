import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseCuarto {
  static final DatabaseCuarto _instance = DatabaseCuarto._internal();
  factory DatabaseCuarto() => _instance;
  DatabaseCuarto._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE clientes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        apellido TEXT,
        nombre TEXT,
        correo TEXT,
        telefono TEXT,
        sexo TEXT,
        estado_civil TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE productos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        descripcion TEXT,
        precio REAL,
        categoria TEXT
      );
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS productos(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          descripcion TEXT,
          precio REAL,
          categoria TEXT
        );
      ''');
    }
  }

  Future<int> insertCliente(Map<String, dynamic> client) async {
    Database db = await database;
    return await db.insert('clientes', client);
  }

  Future<List<Map<String, dynamic>>> getAllClientes() async {
    Database db = await database;
    return await db.query('clientes');
  }

  Future<int> insertProducto(Map<String, dynamic> producto) async {
    Database db = await database;
    return await db.insert('productos', producto);
  }

  Future<List<Map<String, dynamic>>> getAllProductos() async {
    Database db = await database;
    return await db.query('productos');
  }
}