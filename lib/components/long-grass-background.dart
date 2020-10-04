import 'dart:ui';
import 'package:flame/sprite.dart';

import '../bfast-game.dart';

class LongGrassBackground {
  final BFast game;
  Sprite bgSprite;
  Rect bgRect;

  LongGrassBackground(this.game) {
    bgSprite = Sprite('long-grass.png');
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9,
      game.tileSize * 23,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
