import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_project/NewsApp/APIArticleNyt/Model/MovieNytModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNytListArticle extends StatefulWidget {
  DetailNytListArticle({Key? key, required this.results}) : super(key: key);
  Results results;

  @override
  State<DetailNytListArticle> createState() => _DetailNytListArticleState();
}

class _DetailNytListArticleState extends State<DetailNytListArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true ,
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
