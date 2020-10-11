import 'dart:ui';
import 'package:BFast/components/wasp.dart';
import 'package:flame/sprite.dart';
import '../bfast-game.dart';

class Wasp3 extends Wasp {
  double get speed => game.tileSize * 3.8;

  Wasp3(BFast game, double x, double y) : super(game) {
    waspRect = Rect.fromLTWH(x, y, game.tileSize * 1, game.tileSize * 1);
    flyingWasps = List<Sprite>();

    flyingWasps.add(Sprite('wasp3_wing_up.png'));
    flyingWasps.add(Sprite('wasp3_wing_down.png'));
    deadWaspSprite = Sprite('wasp3_dead.png');
  }
}