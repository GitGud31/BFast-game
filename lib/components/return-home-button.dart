import 'dart:ui';

import 'package:BFast/bfast-game.dart';
import 'package:flame/sprite.dart';
import '../views.dart';

class ReturnHomeButton {
  final BFast game;
  Rect rect;
  Sprite sprite;

  ReturnHomeButton(this.game) {
    sprite = Sprite('long_button.png');
    rect = Rect.fromLTWH(
      game.tileSize * 1.5,
      (game.screenSize.height / 1.5) - (game.tileSize * 1.5),
      game.tileSize * 2,
      game.tileSize * 2,
    );
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double dimeDetla) {}

  void onTapDown() {
    //TODO: THIS is causing a problem in mode1 (wait screen). Add check to ignore tap while in that screen.
    game.activeView = Views.home;
    print('${game.activeView}');
  }
}
