import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flomusic/screens/home.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(FloMusic());
}

class FloMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExampleProvider(
      bloc: ExampleBloc(),
      child: MaterialApp(
        title: 'ExampleApp',
        theme: appTheme(),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          "/": (BuildContext context) => ExScreen1(),
          "/ExScreen2": (BuildContext context) => ExScreen2(),
        },
      ),
    );
  }
}
