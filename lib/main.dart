import 'package:flutter/material.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  double _thumbPercent = 0.4;

  Widget _buildRadialSeek() {
    return RadialSeekBar(
      trackColor: Colors.white.withOpacity(.5),
      trackWidth: 2.0,
      progressColor: Colors.white,
      progressWidth: 5.0,
      thumbPercent: _thumbPercent,
      thumb: CircleThumb(
        color: Colors.white,
        diameter: 20.0,
      ),
      progress: _thumbPercent,
      onDragUpdate: (double percent) {
        setState(() {
          _thumbPercent = percent;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black.withOpacity(.8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text("Now Playing",
            style: TextStyle(color: Colors.white, fontFamily: "Nexa")),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: 250,
              height: 250,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.5),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: _buildRadialSeek(),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: ClipOval(
                        clipBehavior: MClipper(),
                        child: Image.asset(
                          "ditf.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }
}
