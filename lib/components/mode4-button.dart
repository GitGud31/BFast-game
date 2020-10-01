import 'dart:ui';

import 'package:flame/sprite.dart';

import '../bfast-game.dart';

class Mode4Button {
  final BFast game;
  Rect rect;
  Sprite sprite;

  Mode4Button(this.game) {
    sprite = Sprite('buttons.png');
    rect = Rect.fromLTWH(
      game.tileSize * 1.5,
      (game.screenSize.height / 1.235) - (game.tileSize * 1.5),
      game.tileSize * 6,
      game.tileSize * 2,
    );
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}

  void onTapDown() {}
}
