import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/provider.dart';

import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff630118),
      statusBarBrightness: Brightness.dark,
    ));
    return ChangeNotifierProvider(
      create: (context) => ProviderClass(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff630118),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

//#85001F   // light primary color
