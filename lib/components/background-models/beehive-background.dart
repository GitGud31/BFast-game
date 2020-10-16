import 'dart:ui';
import 'package:flame/sprite.dart';

import '../../bfast-game.dart';

class LongGrassBackground {
  final BFast game;
  Sprite bgSprite;
  Rect bgRect;

  LongGrassBackground(this.game) {
    bgRect = Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
    bgSprite = Sprite('beehive.png');
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
