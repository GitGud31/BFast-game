import 'dart:ui';

import 'package:flame/sprite.dart';

import '../bfast-game.dart';

class HomeView {
  final BFast game;
  Rect rect;
  Sprite sprite;

  HomeView(this.game) {
    sprite = Sprite('logo_circle.png');
    rect = Rect.fromLTWH(
      game.tileSize * 2.5,
      (game.screenSize.height / 3) - (game.tileSize * 4),
      game.tileSize * 4,
      game.tileSize * 4,
    );
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}
}
