import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:listview_project/NewsApp/APIArticleNyt/Model/ModelSportsNyt.dart';


class ListAllArticle extends StatefulWidget {
  const ListAllArticle({Key? key}) : super(key: key);

  @override
  State<ListAllArticle> createState() => _ListAllArticleState();
}

class _ListAllArticleState extends State<ListAllArticle> {
  
  ModelSportsNyt? modelSportsNyt;
  bool isLoading = true;

  void getAllArticle() async {
    setState(() {
      isLoading = false;
    });
    final res = await http.get(Uri.parse("https://api.nytimes.com/svc/topstories/v2/sports.json?api-key=VAGioGV72XjabZyJsHSbThL3m0ha5QIk"));
    print("Response status: ${res.statusCode}");
    modelSportsNyt = ModelSportsNyt.fromJson(json.decode(res.body.toString()));
    print("article 0 : " + modelSportsNyt!.results![0].title.toString());
    setState(() {
      isLoading = true;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllArticle();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: isLoading ? ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: modelSportsNyt!.results!.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    //snackbar
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(modelSportsNyt!.results![index].title.toString()),
                    ));
                  });
                },
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                  child: Padding(
                    padding: EdgeInsets.all(10),

                    child: Text(
                      modelSportsNyt!.results![index].title.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ) : CircularProgressIndicator(color: Colors.black,),
        ),
      ),
    );
  }

  
}
