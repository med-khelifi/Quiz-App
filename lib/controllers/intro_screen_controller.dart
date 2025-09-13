import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:quiz/core/resources/routes/routes_names.dart';
import 'package:quiz/data/intro%20pages/pages_view_data.dart';
import 'package:quiz/screens/intro/widgets/custom_view_page.dart';

class IntroScreenController {
  static int viewPageCount() => PagesViewData.pageViewData.length;
  static Widget pageViewBuilder(BuildContext context, int index) =>
      CustomViewPage(model: PagesViewData.pageViewData[index]);

  late PageController _pageController ;
  get pageController => _pageController ;
  late BuildContext _context;
  late final StreamController<int> pageViewController;
  late final Stream<int> pageViewStream;
  late final Sink<int> pageViewSink;
  int _currentIndex = 0;
  IntroScreenController(BuildContext context) {
    _context = context;
    pageViewController = StreamController<int>();
    pageViewStream = pageViewController.stream;
    pageViewSink = pageViewController.sink;
    pageViewSink.add(_currentIndex);
    _pageController = PageController();
  }

  void onNextPressed() {
    _currentIndex++;
    if (_currentIndex < viewPageCount()) {
      pageViewSink.add(_currentIndex);
      _pageController.animateToPage(_currentIndex, duration: Duration(seconds: 1), curve: Curves. linear);
    } else {
      _currentIndex = 0;
      onSkipPressed();
    }
  }
  void onSkipPressed() {
    Navigator.pushNamedAndRemoveUntil(_context, RoutesNames.loginScreen,(p)=>false);
  }

  void onViewPageChanged(int idx) {
    pageViewSink.add(idx);
    _pageController.animateToPage(idx, duration: Duration(seconds: 1), curve: Curves.linear);
    _currentIndex = idx;
  }

  void dispose() {
    pageViewController.close();
    pageViewSink.close();
  }
}
