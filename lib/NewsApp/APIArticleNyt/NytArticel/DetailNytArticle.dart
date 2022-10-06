import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_project/NewsApp/APIArticleNyt/Model/WorldNytModel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DetailNytListArticle extends StatefulWidget {
  const DetailNytListArticle({Key? key, required this.results}) : super(key: key);
  final Results results;

  @override
  State<DetailNytListArticle> createState() => _DetailNytListArticleState();
}

class _DetailNytListArticleState extends State<DetailNytListArticle> {

  var database;
  bool isFavorit = false;

  static const List<String> choices = <String>[
    "Favorite"
  ];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDB();
  }

  Future initDB() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'nytDB.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE nyt(title TEXT NOT NULL, abstract TEXT NOT NULL, url TEXT NOT NULL, multimedia TEXT)",
        );
      },
      version: 1,
    );
    isFavorit = await readNyt(widget.results.title);
    setState(() {

    });
  }

Future<void> insertResults(Results results) async {
    final Database db = await database;
    await db.insert(
      'nyt',
      results.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    setState(() {
      isFavorit = true;
    });
  }
  
  Future<void> deleteNyt(Results? results) async {
    final db = await database;
    await db.delete(
      'nyt',
      where: "title = ?",
      whereArgs: [results!.title],
    );
    setState(() {
      isFavorit = false;
    });
  }
  
  Future<bool> readNyt(String? title) async {
    final Database db = await database;
    final data = await db.query('nyt', where: "title = ?", whereArgs: [title]);
    if (data.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            isFavorit ? deleteNyt(widget.results) : insertResults(widget.results);
          }, icon: isFavorit ? Icon(Icons.favorite, color: Colors.black,) : Icon(Icons.favorite_border, color: Colors.black,)),
        ],
        centerTitle: true ,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title:  Text("Besito Times",
          style: GoogleFonts.unifrakturMaguntia(textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),),),
        backgroundColor: Colors.white,
      ),
      body: WebView(
        initialUrl: widget.results.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}
