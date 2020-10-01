import 'dart:ui';

import 'package:flame/sprite.dart';

import '../bfast-game.dart';

class Mode3Button {
  final BFast game;
  Rect rect;
  Sprite sprite;

  Mode3Button(this.game) {
    sprite = Sprite('buttons.png');
    rect = Rect.fromLTWH(
      game.tileSize * 1.5,
      (game.screenSize.height / 1.43) - (game.tileSize * 1.5),
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
