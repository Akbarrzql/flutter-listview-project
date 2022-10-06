import 'package:listview_project/NewsApp/APIArticleNyt/Model/WorldNytModel.dart';
import 'package:sqflite/sqflite.dart';

class NytDBHelper{
  static final NytDBHelper instance = NytDBHelper.init();

  static Database? _database;
  NytDBHelper.init();

  static const _nytDBName = 'nytDB.db';
  static const _tableName = 'myTable';
  static const columnIdDB = '_id';
  static const columnSection = 'section';
  static const columnSubsection = 'subsection';
  static const columnTitleDB = 'title';
  static const columnAbstractDB = 'abstract';
  static const columnUrlDB = 'url';
  static const columnUriDB = 'uri';
  static const columnBylineDB = 'byline';
  static const columnItemTypeDB = 'itemType';
  static const columnUpdatedDateDB = 'updatedDate';
  static const columnCreatedDateDB = 'createdDate';
  static const columnPublishedDateDB = 'publishedDate';
  static const columnMaterialTypeFacetDB = 'materialTypeFacet';
  static const columnkickerDB = 'kicker';
  static const columnDesFacetDB = 'desFacet';
  static const columnOrgFacetDB = 'orgFacet';
  static const columnPerFacetDB = 'perFacet';
  static const columnGeoFacetDB = 'geoFacet';
  static const columnImageDB = 'multimedia';
  static const columnShortUrlDB = 'shortUrl';


Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDB('nyt.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final intType = 'INTEGER NOT NULL';
    await db.execute('''
    CREATE TABLE $_tableName(
    ${columnIdDB} ${idType},
    ${columnSection} ${textType},
    ${columnSubsection} ${textType},
    ${columnTitleDB} ${textType},
    ${columnAbstractDB} ${textType},
    ${columnUrlDB} ${textType},
    ${columnUriDB} ${textType},
    ${columnBylineDB} ${textType},
    ${columnItemTypeDB} ${textType},
    ${columnUpdatedDateDB} ${textType},
    ${columnCreatedDateDB} ${textType},
    ${columnPublishedDateDB} ${textType},
    ${columnMaterialTypeFacetDB} ${textType},
    ${columnkickerDB} ${textType},
    ${columnDesFacetDB} ${textType},
    ${columnOrgFacetDB} ${textType},
    ${columnPerFacetDB} ${textType},
    ${columnGeoFacetDB} ${textType},
    ${columnImageDB} ${textType},
    ${columnShortUrlDB} ${textType}
    )
    ''');
  }

  //create
  Future<int> createNyt(Results nytDBModel) async{
    final db = await instance.database;
    final id = await db.insert(_tableName, nytDBModel.toJson());
    return id;
  }

  //read
  Future<Results> readNyt(int id) async{
    final db = await instance.database;
    final data = await db.query(_tableName, where: '${columnIdDB} = ?', whereArgs: [id]);
    return Results.fromJson(data.first);
  }

  //readall
  Future<List<Results>> readAllNyt() async{
    final db = await instance.database;
    final data = await db.query(_tableName);
    return data.map((e) => Results.fromJson(e)).toList();
  }

  //deleted
  Future<int> delete(int id) async{
    final db = await instance.database;
    final result = await db.delete(_tableName, where: '${columnIdDB} = ?', whereArgs: [id]);
    return result;
  }

  //updated
  Future<int> update(Results nytDBModel, int? id) async{
    final db = await instance.database;
    final result = await db.update(_tableName, nytDBModel.toJson(), where: '${columnIdDB} = ?', whereArgs: [id]);
    return result;
  }

  //close
  Future close() async{
    final db = await instance.database;
    db.close();
  }

}