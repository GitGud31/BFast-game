import 'dart:ui';

import 'package:flame/sprite.dart';

import '../bfast-game.dart';

class GetReadyView {
  final BFast game;
  Rect rect;
  Sprite sprite;

  GetReadyView(this.game) {
    rect = Rect.fromLTWH(
      0,
      0,
      game.screenSize.width,
      game.screenSize.height,
    );
    sprite = Sprite('backyard.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}
}
