import 'package:flutter/material.dart';
import 'package:trivia_app/first_page.dart';
import 'package:trivia_app/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.appLightTheme(context),
      darkTheme: CustomTheme.appDarkTheme(context),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: FirstPage(),
    );
  }
}
