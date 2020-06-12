import 'package:flutter/material.dart';
import 'CommonFunctions.dart';
import 'ImgPath.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation cloudOffset, planRightOffset, planLeftOffset, carLeftOffset, logoOffset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1800));

    cloudOffset = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero).animate(controller);
    planRightOffset = Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0)).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.2, 1.0, curve: Curves.decelerate)));
    planLeftOffset = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.2, 1.0, curve: Curves.decelerate)));
    carLeftOffset = Tween<Offset>(begin: Offset(-5.0, 0.0), end: Offset.zero).animate(controller);
    logoOffset =Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.7, 1.0, curve: Curves.bounceIn)));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImgPath.splash_bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: SlideTransition(
                position: cloudOffset,
                child: Image.asset(ImgPath.splash_cloud),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: SlideTransition(
                  position: planRightOffset,
                  child: Image.asset(ImgPath.splash_plane_right),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: SlideTransition(
                  position: planLeftOffset,
                  child: Image.asset(ImgPath.splash_plane_left),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 200),
                child: SlideTransition(
                  position: logoOffset,
                  child: Text(
                    "tourex",
                    style: TextStyle(
                        fontSize: 55, color: HexColor("#00d8cb"), fontFamily: "dusha"),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child:
                    Image.asset(ImgPath.splash_building, width: MediaQuery.of(context).size.width),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: SlideTransition(
                  position: carLeftOffset,
                  child: Image.asset(ImgPath.splash_car),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
