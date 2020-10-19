import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import '../../bfast-game.dart';
import '../../modes.dart';
import '../../views.dart';

class PlayAgainButton {
  final BFast game;
  Rect rect;
  Sprite sprite;

  PlayAgainButton(this.game) {
    // sprite = Sprite('play_again_circle_button.png', x: 0, y: 0);
    sprite = Sprite('play_again_long_button.png', x: 0, y: 0);
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
      game.stopwatchController.resetStopwatch();
      game.randomTimerController.startRandomTimer();
      game.activeView = Views.wait;
    }

    if (game.activeMode == Modes.mode2) {
      game.waspSpawnerController.start();
      game.activeView = Views.playing;
      game.scoreMode2 = 0;
      game.lives = 3;
    }

    //TODO
    if (game.activeMode == Modes.mode3) {
      game.beeSpawnerController.start();
      game.waspSpawnerController.start();
      game.activeView = Views.playing;
      game.scoreMode3 = 0;
      game.lives = 3;
    }

    //TODO
    if (game.activeMode == Modes.mode4) {}
  }
}
