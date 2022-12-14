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

  bool loading = false;
  static const List<String> choices = <String>[
    "Favorite"
  ];

  @override
  void initState() {
    setState(() {
      loading = true;
    });
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
        actions: <Widget>[
        PopupMenuButton(
        onSelected: _select,
        padding: EdgeInsets.zero,
        // initialValue: choices[_selection],
        itemBuilder: (BuildContext context) {
          return choices.map((String choice) {
            return  PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );}
          ).toList();
        },
      ),
      ],
      ),
      body: loading ? WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ) : Center(
        child: CircularProgressIndicator(),
        ),
    );
  }

  void _select(String value) {
    switch (value) {
      case "Favorite":
        setState(() {

        });
        break;
    }
  }
}
