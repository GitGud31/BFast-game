import 'dart:ui';

import 'package:flame/sprite.dart';

import '../bfast-game.dart';
import '../views.dart';

class Mode4Button {
  final BFast game;
  Rect rect;
  Sprite sprite;

  Mode4Button(this.game) {
    sprite = Sprite('mode_button.png');
    rect = Rect.fromLTWH(
      game.tileSize * 4.1,
      (game.screenSize.height / 1.6),
      game.tileSize * 3.4,
      game.tileSize * 3,
    );
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}

  void onTapDown() {
    game.activeView = Views.getReady;
  }
}
