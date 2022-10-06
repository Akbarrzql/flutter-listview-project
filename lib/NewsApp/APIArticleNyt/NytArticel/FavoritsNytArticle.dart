import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_project/NewsApp/APIArticleNyt/Model/WorldNytModel.dart';
import 'package:listview_project/NewsApp/APIArticleNyt/NytArticel/DetailNytArticle.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavoritsNytArticle extends StatefulWidget {
  const FavoritsNytArticle({Key? key}) : super(key: key);


  @override
  State<FavoritsNytArticle> createState() => _FavoritsNytArticleState();
}

class _FavoritsNytArticleState extends State<FavoritsNytArticle> {

  List<Results> results = <Results>[];
  var database;

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

    getResults().then((value) {
      setState(() {
        results = value;
      });
    });
  }

  Future<List<Results>> getResults() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('nyt');
    return List.generate(maps.length, (i) {
      return Results(
        title: maps[i]['title'],
        abstract: maps[i]['abstract'],
        url: maps[i]['url'],
        imageurl: maps[i]['multimedia'],
      );
    });
  }

  Future<void> deleteNyt(Results results) async {
    final db = await database;
    await db.delete(
      'nyt',
      where: "title = ?",
      whereArgs: [results.title],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorits"),
      ),
      body: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){

                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        //image
                        child: Image.network(
                              results[index].imageurl.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                        //title
                        child: Text(
                        results[index].title.toString(),
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: GoogleFonts.ptSerif(color: Colors.black, fontWeight: FontWeight.bold).fontFamily,),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, left: 10, right: 10,bottom: 10),
                        //description
                        child: Text(
                          results[index].abstract.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){
                                deleteNyt(results[index]);
                                setState(() {
                                  results.removeAt(index);
                                });
                              }, icon: const Icon(Icons.delete, color: Colors.red,)),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                        height: 10,
                        indent: 13,
                        endIndent: 13,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
