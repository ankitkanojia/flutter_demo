import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {
  final double _smallFontSize = 12;
  final double _valFontSize = 30;
  final FontWeight _smallFontWeight = FontWeight.w500;
  final FontWeight _valFontWeight = FontWeight.w700;
  final double _smallFontSpacing = 1.3;
  final Color _fontColor = Color(0xff5b6990);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      alignment: Alignment.topCenter,
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "AVERAGE SLEEP",
                    style: TextStyle(
                        fontSize: _smallFontSize,
                        fontWeight: _smallFontWeight,
                        letterSpacing: _smallFontSpacing,
                        color: _fontColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "6.45h",
                    style: TextStyle(fontSize: _valFontSize, fontWeight: _valFontWeight, color: _fontColor),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "AVERAGE SLEEP",
                    style: TextStyle(
                        fontSize: _smallFontSize,
                        fontWeight: _smallFontWeight,
                        letterSpacing: _smallFontSpacing,
                        color: _fontColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "6.45h",
                    style: TextStyle(fontSize: _valFontSize, fontWeight: _valFontWeight, color: _fontColor),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Color(0xfff0f5fb),
                    border: Border.all(width: 8, color: Color(0xffd3e1ed)),
                    borderRadius: BorderRadius.circular(3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("THIS WEEK",
                        style: TextStyle(
                            fontSize: _smallFontSize,
                            fontWeight: _smallFontWeight,
                            letterSpacing: _smallFontSpacing,
                            color: _fontColor)),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 110,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: CustomPaint(
                        foregroundPainter: GraphPainter(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 25),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "THRUSDAY"),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "WEDNESDAY"),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "FRIDAY"),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "SATURDAY"),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "SUNDAY"),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing, day: "MONDAY"),
        ],
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  var trackBarPaint = Paint()
    ..color = Color(0xff818aab)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 12;

  var trackPaint = Paint()
    ..color = Color(0xffdee6f1)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 12;

  @override
  void paint(Canvas canvas, Size size) {
    var trackPath = new Path();
    var trackBarPath = new Path();

    List val = [
      size.height * 0.8,
      size.height * 0.5,
      size.height * 0.9,
      size.height * 0.8,
      size.height * 0.5,
    ];

    double origin = 8;

    for (int i = 0; i < val.length; i++) {
      trackPath.moveTo(origin, size.height);
      trackPath.lineTo(origin, 0);

      trackBarPath.moveTo(origin, size.height);
      trackBarPath.lineTo(origin, val[i]);

      origin = origin + size.width * 0.22;
    }

    canvas.drawPath(trackPath, trackPaint);
    canvas.drawPath(trackBarPath, trackBarPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RecordItem extends StatelessWidget {
  const RecordItem({Key key, @required Color fontColor, @required double smallFontSpacing, @required this.day})
      : _fontColor = fontColor,
        _smallFontSpacing = smallFontSpacing,
        super(key: key);

  final Color _fontColor;
  final double _smallFontSpacing;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffdde9f7), width: 1.5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            day,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _fontColor),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              Text(
                "16/04/1993",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: _smallFontSpacing, color: _fontColor),
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                child: Text(
                  "45.3 MINUTES",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: _smallFontSpacing, color: _fontColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
