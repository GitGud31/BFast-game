import 'dart:ui';

import 'package:BFast/views/callout.dart';
import 'package:flame/sprite.dart';

import '../bfast-game.dart';
import '../views.dart';

class Wasp {
  final BFast game;
  List<Sprite> flyingWasps;
  Rect waspRect;
  Sprite deadWaspSprite;
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

  void render(Canvas canvas) {
    if (isDead) {
      deadWaspSprite.renderRect(canvas, waspRect.inflate(waspRect.width / 2));
    } else {
      flyingWasps[flyingWaspIndex.toInt()]
          .renderRect(canvas, waspRect.inflate(waspRect.width / 2));
      if (game.activeView == Views.playing) {
        callout.render(canvas);
      }
    }
  }

  void update(double timeDelta) {
    if (isDead) {
      //Make wasp fall
      waspRect = waspRect.translate(0, game.tileSize * 12 * timeDelta);
      if (waspRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      //Flap wings
      flyingWaspIndex += 30 * timeDelta;
      while (flyingWaspIndex >= 2) {
        flyingWaspIndex -= 2;
      }

      //Move wasp
      double stepDistance = speed * timeDelta;
      Offset toTarget = targetLocation - Offset(waspRect.left, waspRect.top);

      if (stepDistance < toTarget.distance) {
        Offset stepToTarget =
            Offset.fromDirection(toTarget.direction, stepDistance);
        waspRect = waspRect.shift(stepToTarget);
      } else {
        waspRect = waspRect.shift(toTarget);
        setTargetLocation();
      }

      callout.update(timeDelta);
    }
  }

  void onTapDown() {
    if (!isDead) {
      //TODO: Implement sound

      isDead = true;

      if (game.activeView == Views.playing) {
        game.score += 1;
        if (game.score > (game.sharedPreferences.getInt('highscore') ?? 0)) {
          game.sharedPreferences.setInt('highscore', game.score);
          game.highscoreDisplay.updateHighscore();
        }
      }
    }
  }
}
