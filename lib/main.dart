// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shots/configs/theme.dart';
import 'package:shots/providers/news_provider.dart';
import 'package:shots/screens/home_screen.dart';
import 'package:shots/screens/tech_news_screen.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsProvider>(
            create: (context) => NewsProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: themeData,
        routes: {
          TechNewsScreen.routeName: (context) => TechNewsScreen(),
        },
        home: HomeScreen(),
      ),
    );
  }
}
