import 'dart:ui';

import 'package:flame/sprite.dart';

import '../bfast-game.dart';

class HomeView {
  final BFast game;
  Rect rect;
  Sprite sprite;

  HomeView(this.game) {
    rect = Rect.fromLTWH(
      (game.screenSize.width / 2) - (game.tileSize * 1.7),
      (game.screenSize.height / 3) - (game.tileSize * 4),
      game.tileSize * 3.5,
      game.tileSize * 3,
    );
    sprite = Sprite('logo3.png');
    // sprite = Sprite('logo_circle.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}
}
