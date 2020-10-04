import 'dart:ui';
import 'package:BFast/views/mode2%20views/wasp.dart';
import 'package:flame/sprite.dart';
import '../bfast-game.dart';

class Wasp3 extends Wasp {
  double get speed => game.tileSize * 3.8;

  Wasp3(BFast game, double x, double y) : super(game) {
    waspRect = Rect.fromLTWH(x, y, game.tileSize * 1, game.tileSize * 1);
    flyingWasps = List<Sprite>();

    //TODO: Add proper assets
    flyingWasps.add(Sprite('wasp3.png'));
    flyingWasps.add(Sprite('wasp3.png'));
    deadWaspSprite = Sprite('wasp3.png');
  }
}