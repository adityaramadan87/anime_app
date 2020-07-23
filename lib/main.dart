import 'package:anime_app/Route/Router.dart';
import 'package:anime_app/constant/Constant.dart';
import 'package:anime_app/screen/HomeScreen.dart';
import 'package:anime_app/screen/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings routeSetting) {
        final args = routeSetting.arguments;

        switch (routeSetting.name) {
          case Constant.HOME:
            return Router(
              builder: (_) => HomeScreen(),
              settings: routeSetting,
            );
        }

      },
    );
  }
}

