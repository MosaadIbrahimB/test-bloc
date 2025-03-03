import 'package:flutter/material.dart';
import 'package:radio/screen/counter_screen/counter_screen.dart';
import 'package:radio/screen/posts/posts_screen.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'radio app',
      home: const PostsScreen(),
    );
  }
}

