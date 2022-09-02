import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_project/NewsApp/Headlines/HeadlinesModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailHeadlines extends StatefulWidget {
  DetailHeadlines({Key? key, required this.url, required this.title}) : super(key: key);
  final url;
  final title;

  @override
  State<DetailHeadlines> createState() => _DetailHeadlinesState();
}

class _DetailHeadlinesState extends State<DetailHeadlines> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
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
      body: (
      WebView(
        initialUrl: widget.url,
      )
      )
    );
  }
}
