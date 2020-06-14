import 'package:ui_clock/clock/clock_text.dart';
import 'package:flutter/material.dart';

class ClockFace extends StatelessWidget {
  final DateTime dateTime;
  final ClockText clockText;

  ClockFace({this.clockText = ClockText.arabic, this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new AspectRatio(
          aspectRatio: 0.75,
          child: new Container(
            width: double.infinity,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xfff4f9fd),
            ),
            child: new Stack(
              children: <Widget>[
                //centerpoint
                new Center(
                  child: new Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(8.0, 0),
                          blurRadius: 13,
                          spreadRadius: 1,
                          color: Color(0xffd3e0f0)
                        )
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
