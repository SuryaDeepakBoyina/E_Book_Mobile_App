import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ebook/providers/book_providers.dart';

import 'screens/Homepage.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: "ebookUI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
      
    );
  }
}

