import 'package:flutter/material.dart';
import 'package:notes/services/sharedPref.dart';
import 'screens/home.dart';
import 'data/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData theme = appThemeDark;

  @override
  void initState() {
    super.initState();
    updateThemeFromSharedPref();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: theme,
      home: MyHomePage(title: 'Home', changeTheme: setTheme),
    );
  }

  setTheme(Brightness brightness) {
    if (brightness == Brightness.light) {
      setState(() {
        theme = appThemeLight;
      });
    } else {
      setState(() {
        theme = appThemeDark;
      });
    }
  }

  void updateThemeFromSharedPref() async {
    String themeText = await getThemeFromSharedPref();
    if (themeText == 'dark') {
      setTheme(Brightness.dark);
    } else {
      setTheme(Brightness.light);
    }
  }
}
