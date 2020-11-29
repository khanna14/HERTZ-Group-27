import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GenreTab extends StatefulWidget {
  @override
  _GenreTabState createState() => _GenreTabState();
}

class _GenreTabState extends State<GenreTab> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Expanded(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo1.png',
                    height: 50,
                    width: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16,16,0,16),
                    child: Text(
                      "Hertz",
                      style: TextStyle(color: Colors.pink[100]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,8,0, 0),
                    child: Text("A complete musical app",textScaleFactor: 0.4,),
                  ),
                ],
              )
          ),
        ),
        body: Container(
            color: Colors.grey[600],
            child: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(1.0),
                  child: progress < 1.0
                      ? LinearProgressIndicator(value: progress,)
                      : Container()),
              Expanded(
                child: Container(
                  decoration:
                  BoxDecoration(
                      gradient: SweepGradient(
                    colors: [Colors.white,Colors.pink],
                  )
                  ),
                  child: InAppWebView(
                    initialUrl: "https://genreclassifier.herokuapp.com/",
                    initialHeaders: {},
                    initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                          debuggingEnabled: true,
                        )
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;
                    },
                    onLoadStart: (InAppWebViewController controller, String url) {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onLoadStop: (InAppWebViewController controller, String url) async {
                      setState(() {
                        this.url = url;
                      });
                    },
                    onProgressChanged: (InAppWebViewController controller, int progress) {
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}