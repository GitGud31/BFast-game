import 'dart:ui';
import 'package:BFast/components/wasp.dart';
import 'package:flame/sprite.dart';
import '../bfast-game.dart';

class Wasp4 extends Wasp {
  double get speed => game.tileSize * 4.2;

  Wasp4(BFast game, double x, double y) : super(game) {
    waspRect = Rect.fromLTWH(x, y, game.tileSize * 1, game.tileSize * 1);
    flyingWasps = List<Sprite>();

    //TODO: add proper assets
    flyingWasps.add(Sprite('wasp4.png'));
    flyingWasps.add(Sprite('wasp4.png'));
    deadWaspSprite = Sprite('wasp4.png');
  }
}