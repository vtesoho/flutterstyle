import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(
      const Color(0xFF678FB4),
      'images/a1.png',
      'Hotels',
      'All hotels and hostels are sorted by hospitality rating',
      'images/a1.png'
  ),
  new PageViewModel(
      const Color(0xFF65B0B4),
      'images/a2.png',
      'Banks',
      'We carefully verify all banks before adding them into the app',
      'images/a2.png'
  ),
  new PageViewModel(
    const Color(0xFF9B90BC),
    'images/a3.png',
    'Store',
    'All local stores are categorized for your convenience',
    'images/a3.png',
  ),
];

class Page extends StatelessWidget {
  Page({this.pageViewModel, this.percentVisible = 1.0});
  final PageViewModel pageViewModel;
  final double percentVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: pageViewModel.color,
      child: Opacity(
        opacity: percentVisible,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(0.0, 50.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Image.asset(
                  pageViewModel.heroAssetPath,
                  height: 200.0,
                  width: 200.0,
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text(
                  pageViewModel.title,
                  style: TextStyle(color: Colors.white, fontSize: 34.0),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: Text(
                pageViewModel.body,
                style: TextStyle(color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetIcon;

  PageViewModel(this.color, this.heroAssetPath, this.title, this.body, this.iconAssetIcon);
}