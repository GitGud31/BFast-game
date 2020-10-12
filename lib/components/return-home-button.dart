import 'dart:ui';

import 'package:BFast/bfast-game.dart';
import 'package:flame/sprite.dart';
import '../views.dart';

class ReturnHomeButton {
  final BFast game;
  Rect rect;
  Sprite sprite;

  ReturnHomeButton(this.game) {
    // sprite = Sprite('home_circle_button.png');
    sprite = Sprite('home_long_button.png');
    rect = Rect.fromLTWH(
      game.tileSize * 1.5,
      (game.screenSize.height / 1.5) - (game.tileSize * 1.5),
      game.tileSize * 2.6,
      game.tileSize * 1.8,
    );
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double dimeDetla) {}

  void onTapDown() {
    game.activeView = Views.home;
  }
}
