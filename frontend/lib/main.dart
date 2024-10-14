import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ebook/providers/book_providers.dart';

import 'screens/home_page.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: "ebookUI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Homepage(),
      
    );
  }
}

