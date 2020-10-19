import 'dart:ui';

import 'package:flame/sprite.dart';

import '../../bfast-game.dart';
import 'bee.dart';

class Bee2 extends Bee {
  //TODO: adjust
  double get speed => game.tileSize * 1.5;

  Bee2(BFast game, double x, double y) : super(game) {
    resize(x: x, y: y);
    flyingBees = List<Sprite>();

    //TODO: replace with proper assets
    flyingBees.add(Sprite('bee2.png'));
    flyingBees.add(Sprite('bee2.png'));
    deadBeeSprite = Sprite('bee2.png');
  }

  void resize({double x, double y}) {
    x ??= (beeRect.left) ?? 0;
    y ??= (beeRect.top) ?? 0;

    beeRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
  }
}
