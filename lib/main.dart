import 'package:flutter/material.dart';
import 'package:tstore/utils/theme/theme.dart';

void main() {
  // TODO: Add Widgets Binding
  // TODO: Init local storage
  // TODO: Await Native splash
  // TODO: Initialize firebase
  // TODO: Initialize authentication
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T Store',
      themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      home: const Text(''),
    );
  }
}
