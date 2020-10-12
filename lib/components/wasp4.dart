import 'dart:ui';
import 'package:BFast/components/wasp.dart';
import 'package:flame/sprite.dart';
import '../bfast-game.dart';

class Wasp4 extends Wasp {
  double get speed => game.tileSize * 4.2;

  Wasp4(BFast game, double x, double y) : super(game) {
    resize(x: x, y: y);
    flyingWasps = List<Sprite>();

    flyingWasps.add(Sprite('wasp4_wing_up.png'));
    flyingWasps.add(Sprite('wasp4_wing_down.png'));
    deadWaspSprite = Sprite('wasp4_dead.png');
  }

  void resize({double x, double y}) {
    x ??= (waspRect?.left) ?? 0;
    y ??= (waspRect?.top) ?? 0;
    waspRect = Rect.fromLTWH(x, y, game.tileSize * 1, game.tileSize * 1);
  }
}
