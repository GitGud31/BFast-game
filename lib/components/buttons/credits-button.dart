import 'dart:ui';

import 'package:BFast/bfast-game.dart';
import 'package:flame/sprite.dart';

import '../../views.dart';

class CreditsButton {
  final BFast game;
  Rect rect;
  Sprite sprite;

  CreditsButton(this.game) {
    sprite = Sprite('credits.png');
    rect = Rect.fromLTWH(
      game.screenSize.width - (game.tileSize * 2),
      game.screenSize.height - (game.tileSize * 2),
      game.tileSize * 1.6,
      game.tileSize * 1.8,
    );
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
  }

  void update(double timeDelta) {}

  void onTapDown() {
    game.activeView = Views.credits;
  }
}
