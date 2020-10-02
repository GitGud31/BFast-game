import 'dart:ui';

import 'package:flame/sprite.dart';

import '../bfast-game.dart';

class ScoreView {
  final BFast game;
  Rect rect;
  Sprite sprite;

  ScoreView(this.game) {
    rect = Rect.fromLTWH(
      0,
      0,
      game.screenSize.width,
      game.screenSize.height,
    );
    sprite = Sprite('score_screen.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}
}
