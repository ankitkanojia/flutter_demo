import 'package:flutter/material.dart';
import 'package:ui_intro/page_revel.dart';
import 'package:ui_intro/pager_indicator.dart';
import 'package:ui_intro/pages.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activeIndex = 0;
  double slidePercent = 0.0;
  SlideDirection slideDirection = SlideDirection.leftToRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Page(
          viewModel: pages[0],
          percentVisible: 1.0,
        ),
        PageRevel(
          revealPercent: 1.0,
          child: Page(
            viewModel: pages[1],
            percentVisible: 1.0,
          ),
        ),
        PagerIndicator(
          viewModel: PagerIndicatorViewModel(pages, 1, SlideDirection.rightToLeft,1.0),
        )
      ],
    ));
  }
}
