import 'dart:ui';
import 'package:BFast/components/wasp.dart';
import 'package:flame/sprite.dart';
import '../bfast-game.dart';

class Wasp1 extends Wasp {
  double get speed => game.tileSize * 1.5;

  Wasp1(BFast game, double x, double y) : super(game) {
    waspRect = Rect.fromLTWH(x, y, game.tileSize * 1, game.tileSize * 1);
    flyingWasps = List<Sprite>();

    //TODO: add proper assets
    flyingWasps.add(Sprite('wasp1.png'));
    flyingWasps.add(Sprite('wasp1.png'));
    deadWaspSprite = Sprite('wasp1.png');
  }
}