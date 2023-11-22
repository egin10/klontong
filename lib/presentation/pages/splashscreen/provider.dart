import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:klontong/config/route/app_router.dart';

import 'state.dart';

class SplashscreenProvider extends ChangeNotifier {
  final state = SplashscreenState();

  void startTimer(BuildContext context) {
    const period = Duration(seconds: 1);
    state.timer = Timer.periodic(period, (timer) async {
      state.second--;

      if (state.second == 0) {
        cancelFlashTimer();
        context.router.replaceAll([const ListProductRoute()]);
      }
    });
    notifyListeners();
  }

  void cancelFlashTimer() {
    if (state.timer != null) {
      state.timer!.cancel();
      state.timer = null;
      notifyListeners();
    }
  }

  SplashscreenProvider(BuildContext context) {
    startTimer(context);
  }

  @override
  void dispose() {
    cancelFlashTimer();
    super.dispose();
  }
}
