import 'dart:ui';

import 'package:flame/sprite.dart';

import '../../bfast-game.dart';
import '../../modes.dart';
import '../../views.dart';

class StartGameButton {
  final BFast game;
  Rect rect;
  Sprite sprite;

  StartGameButton(this.game) {
    // sprite = Sprite('start_circle_button.png');
    sprite = Sprite('start_long_button.png');
    rect = Rect.fromLTWH(
      game.screenSize.width - (game.tileSize * 4),
      (game.screenSize.height / 1.5) - (game.tileSize * 1.5),
      game.tileSize * 2.6,
      game.tileSize * 1.8,
    );
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}

  void onTapDown() {
    if (game.activeMode == Modes.mode1) {
      game.randomTimerController.startRandomTimer();
      game.activeView = Views.wait;
    }

    if (game.activeMode == Modes.mode2) {
      game.waspSpawnerController.start();
      game.activeView = Views.playing;
      game.score = 0;
      game.lives = 3;
    }

    //TODO
    if (game.activeMode == Modes.mode3) {
      game.score = 0;
      game.lives = 3;
    }

    //TODO
    if (game.activeMode == Modes.mode4) {}
  }
}
