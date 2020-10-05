import 'dart:ui';
import 'package:BFast/components/wasp.dart';
import 'package:flame/sprite.dart';
import '../bfast-game.dart';

class Wasp2 extends Wasp {
  double get speed => game.tileSize * 2.3;

  Wasp2(BFast game, double x, double y) : super(game) {
    waspRect = Rect.fromLTWH(x, y, game.tileSize * 1, game.tileSize * 1);
    flyingWasps = List<Sprite>();

    //TODO: Add propser assets
    flyingWasps.add(Sprite('wasp2.png'));
    flyingWasps.add(Sprite('wasp2.png'));
    deadWaspSprite = Sprite('wasp2.png');
  }
}