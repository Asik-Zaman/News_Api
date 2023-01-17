import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsView extends StatefulWidget {
  final String link;

  const NewsView({super.key, required this.link});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  bool isLoading = true;
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        (() => setState(() {
              isLoading = false;
            })));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'News View',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            elevation: 6.0,
          ),
          backgroundColor: Colors.white,
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: WebView(
                    initialUrl: widget.link,
                    onWebViewCreated: ((controller) {
                      _completer.complete(controller);
                    }),
                  ),
                )),
    );
  }
}
