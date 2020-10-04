import 'dart:ui';

import 'package:BFast/bfast-game.dart';
import 'package:flame/sprite.dart';

import '../views.dart';

class HowToPlayButton {
  final BFast game;
  Rect rect;
  Sprite sprite;

  HowToPlayButton(this.game) {
    sprite = Sprite('mode_button.png');
    rect = Rect.fromLTWH(
      game.tileSize * .25,
      game.screenSize.height - (game.tileSize * 1.25),
      game.tileSize,
      game.tileSize,
    );
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}

  void onTapDown() {
    game.activeView = Views.howToPlay;
  }
}
