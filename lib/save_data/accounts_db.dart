import 'package:ecom/save_data/account.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class AccountsDatabase{
  static final AccountsDatabase instance = AccountsDatabase._init();
  static Database? _database;
  AccountsDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDB('accounts.db');
    return _database!;
  }
  Future<Database> get _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version:1, onCreate: _createDB);
  }
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';
    await db.execute('''
    CREATE TABLE $tableAccounts (
    ${AccountFields.id} $idType,
    ${AccountFields.email} $textType,
    ${AccountFields.password} $textType,
    ${AccountFields.firstName} $textType,
    ${AccountFields.lastName} $textType,
    ${AccountFields.phoneNumber} $integerType,
    )
    ''');
  }

  Future<Account> create(Account account) async {
    final db = await instance.database;
    final id = await db.insert(tableAccounts, account.toJson());
    return account.copy(id: id);
  }

  Future<Account> readAccount(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableAccounts,
      columns: AccountFields.values,
      where: '${AccountFields.id} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty) {
      return Account.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Account>> readAllAccounts() async {
    final db = await instance.database;

    final result = await db.query(tableAccounts);

    return result.map((json) => Account.fromJson(json)).toList();
  }

  Future<int> update(Account account) async {
    final db = await instance.database;
    return db.update(
      tableAccounts,
      account.toJson(),
      where: '${AccountFields.id} = ?',
      whereArgs: [account.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableAccounts,
      where: '${AccountFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}