import 'dart:ui';

import 'package:flame/sprite.dart';

import '../bfast-game.dart';
import '../views.dart';

class Mode1Button {
  final BFast game;
  Rect rect;
  Sprite sprite;

  Mode1Button(this.game) {
    sprite = Sprite('mode1_button.png');
    rect = Rect.fromLTWH(
      game.tileSize * 2,
      (game.screenSize.height / 3),
      game.tileSize * 3.4,
      game.tileSize * 3,
    );
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}

  void onTapDown() {
    game.activeView = Views.getReady;
  }
}
