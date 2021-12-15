import 'package:flutter/material.dart';
import './screens/utils.dart';

import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NovaMed',
        theme: ThemeData(
            scaffoldBackgroundColor: mainBgColor,
            primarySwatch: Colors.purple,
            accentColor: Colors.pink[100],
            fontFamily: 'GentiumBookBasic',
            textTheme: ThemeData.light().textTheme.copyWith(
                  button: TextStyle(color: Colors.white),
                  headline1: TextStyle(
                      fontSize: 18,
                      fontFamily: 'GentiumBookBasic',
                      color: Colors.white),
                ),
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(fontFamily: 'Lobster', fontSize: 28),
                    ))),
        home: TabsScreen());
  }
}
