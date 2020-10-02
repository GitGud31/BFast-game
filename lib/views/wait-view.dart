import 'dart:ui';

import 'package:flame/sprite.dart';

import '../bfast-game.dart';

class WaitView {
  final BFast game;
  Rect rect;
  Sprite sprite;

  WaitView(this.game) {
    sprite = Sprite('wait_screen.png');
    rect = Rect.fromLTWH(
      0,
      0,
      game.screenSize.width,
      game.screenSize.height,
    );
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}
}
