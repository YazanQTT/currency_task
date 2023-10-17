import 'package:currency_task/src/features/currencies/currencies.export.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqfliteService {
  Future<bool> insertData(List<CurrencyModel> list);

  Future<List<Map<String, dynamic>>> getData();
}

@LazySingleton(as: SqfliteService)
class SqfliteServiceImpl implements SqfliteService {
  static const _databaseName = 'currency_db';
  static const _tableName = 'c_table';
  static const _databaseVersion = 1;
  static const _columnId = 'id';
  static const _columnSymbol = 'currencySymbol';
  static const _columnName = 'currencyName';
  static const _columnCode = 'code';
  static Database? _database;

  static const createCurrenciesTable = '''
          CREATE TABLE $_tableName(
            $_columnId TEXT PRIMARY KEY NOT NULL,
            $_columnSymbol TEXT NOT NULL,
            $_columnName TEXT NOT NULL, 
            $_columnCode TEXT NOT NULL
          );
        ''';

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) async {
        await db.execute(createCurrenciesTable);
      },
      version: _databaseVersion,
    );
  }

  @override
  Future<bool> insertData(List<CurrencyModel> currencies) async {
    final db = await database;
    currencies.forEach((element) async {
      await db.transaction((txn) async {
        await txn.insert(
          _tableName,
          element.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      });
    });
    return true;
  }

  @override
  Future<List<Map<String, dynamic>>> getData() async {
    final db = await database;
    return await db.query(_tableName);
  }
}
