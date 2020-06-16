import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common_functions.dart';

final pages = [
  PageViewModel("#678FB4", "assets/hotels.png", "All hotels and hostels are sorted as per hospiality", "assets/key.png", "Hotels"),
  PageViewModel(
      "#65B0B4", "assets/banks.png", "We carefully verify all app before adding into the app", "assets/wallet.png", "Banks"),
  PageViewModel("#9B90BC", "assets/stores.png", "All stores categoriesed for your convenience", "assets/shopping_cart.png", "Store")
];

class Page extends StatelessWidget {
  final PageViewModel viewModel;
  final double percentVisible;

  Page({this.viewModel, this.percentVisible = 1.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: HexColor(viewModel.color),
      child: Opacity(
        opacity: percentVisible,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(0.0, 50.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 25.0),
                child: Image.asset(
                  viewModel.heroAssetPath,
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text(
                  viewModel.title,
                  style: TextStyle(fontSize: 34.0, color: Colors.white, fontFamily: 'FlamanteRoma'),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text(
                  viewModel.body,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0, color: Colors.white, fontFamily: 'FlamanteRoma'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageViewModel {
  final String color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  PageViewModel(this.color, this.heroAssetPath, this.body, this.iconAssetPath, this.title);
}
