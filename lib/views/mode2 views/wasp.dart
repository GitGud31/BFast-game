import 'dart:ui';

import 'package:BFast/views/callout.dart';
import 'package:flame/sprite.dart';

import '../../bfast-game.dart';

class Wasp {
  final BFast game;
  List<Sprite> flyingWasps;
  Rect waspRect;
  Sprite deadWasSprite;
  double flyingWaspIndex = 0;
  bool isDead = false;
  bool isOffScreen = false;
  Offset targetLocation;

  Callout callout;

  double get speed => game.tileSize * 3;

  Wasp(this.game) {
    callout = Callout(this);
    setTargetLocation();
  }

  void setTargetLocation() {
    double x = game.random.nextDouble() *
        (game.screenSize.width - (game.tileSize * 1.35));
    double y = (game.random.nextDouble() *
            (game.screenSize.height - (game.tileSize * 2.85))) +
        (game.tileSize * 1.5);

    targetLocation = Offset(x, y);
  }

  void render(Canvas canvas) {}

  void update(double timeDelta) {}
}
