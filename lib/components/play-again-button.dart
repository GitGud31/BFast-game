import 'dart:ui';

import 'package:flame/sprite.dart';

import '../bfast-game.dart';
import '../views.dart';

class PlayAgainButton {
  final BFast game;
  Rect rect;
  Sprite sprite;

  PlayAgainButton(this.game) {
    sprite = Sprite('play again button.png');
    rect = Rect.fromLTWH(
      game.tileSize * 5,
      (game.screenSize.height / 1.5) - (game.tileSize * 1.5),
      game.tileSize * 2,
      game.tileSize * 2,
    );
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}

  void onTapDown() {
    game.activeView = Views.wait;
  }
}
