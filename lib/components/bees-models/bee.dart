import 'dart:ui';

import 'package:flame/sprite.dart';
import '../../bfast-game.dart';

class Bee {
  final BFast game;
  List<Sprite> flyingBees;
  Rect beeRect;
  Sprite deadBeeSprite;
  double flyingBeeIndex = 0;
  bool isDead = false;
  bool isOffScreen = false;
  Offset targetLocation;

  double get speed => game.tileSize * 3;

  Bee(this.game) {
    setTargetLocation();
  }

  void setTargetLocation() {
    double x = game.random.nextDouble() *
            (game.screenSize.width - (game.tileSize * 1.35)) +
        (game.tileSize * 1.5);
    double y = game.random.nextDouble() *
            (game.screenSize.height - (game.tileSize * 1.35)) +
        (game.tileSize * 1.5);

    targetLocation = Offset(x, y);
  }

  void render(Canvas canvas) {
    if (isDead) {
      deadBeeSprite.renderRect(canvas, beeRect.inflate(beeRect.width / 2));
    } else {
      flyingBees[flyingBeeIndex.toInt()]
          .renderRect(canvas, beeRect.inflate(beeRect.width / 2));
      //
    }
  }

  void update(double timeDelta) {
    //TODO: if waspLocation == beeLocation => isDead = true; and lose 1 life;

    if (isDead) {
      //Make bee fall
      beeRect = beeRect.translate(0, game.tileSize * 12 * timeDelta);
      if (beeRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      //Flap wings
      flyingBeeIndex += 30 * timeDelta;
      while (flyingBeeIndex >= 2) {
        flyingBeeIndex -= 2;
      }

      //Move wasp
      double stepDistance = speed * timeDelta;
      Offset toTarget = targetLocation - Offset(beeRect.left, beeRect.top);

      if (stepDistance < toTarget.distance) {
        Offset stepToTarget =
            Offset.fromDirection(toTarget.direction, stepDistance);
        beeRect = beeRect.shift(stepToTarget);
      } else {
        beeRect = beeRect.shift(toTarget);
        setTargetLocation();
      }
      //
    }
  }

  void onTapDown() {}
}
