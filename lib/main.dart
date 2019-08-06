import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
import 'dart:math';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/ditf.jpg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
            ),
          ),
        ),
        new Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            title: Text(
              "Now Playing",
              style: TextStyle(
                  color: Colors.white, fontFamily: "OverpassMonoBold"),
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.playlist_play,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: new Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
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
                          padding: const EdgeInsets.all(9),
                          child: _buildRadialSeek(),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: ClipOval(
                              clipper: MClipper(),
                              child: Image.asset(
                                "assets/ditf.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Mika Nakashima",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: "OverpassMono",
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Kiss Of Death",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: "OverpassMonoBold",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 350,
                height: 150,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 65,
                        width: 290,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(35)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.fast_rewind,
                                size: 55,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Icon(
                                Icons.fast_forward,
                                color: Colors.white,
                                size: 55,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 92,
                        height: 92,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            size: 55,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
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

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
