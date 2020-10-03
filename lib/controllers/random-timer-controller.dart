import 'dart:async';
import 'dart:math';

import '../bfast-game.dart';
import '../views.dart';

class RandomTimerController {
  final BFast game;
  Timer timer;
  Random random;

  RandomTimerController(this.game);

  void startRandomTimer() {
    random = Random();
    int randomValue = random.nextInt(1700) + 500;
    timer = Timer(Duration(milliseconds: randomValue), () {
      print('$randomValue');
      print('${timer.isActive}');
      game.activeView = Views.click;
    });
  }

  void cancelRandomTimer() {
    timer.cancel();
  }

  void update(double t) {}
}
