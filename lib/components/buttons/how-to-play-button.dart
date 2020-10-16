import 'dart:ui';

import 'package:BFast/bfast-game.dart';
import 'package:flame/sprite.dart';

import '../../views.dart';

class HowToPlayButton {
  final BFast game;
  Rect rect;
  Sprite sprite;

  HowToPlayButton(this.game) {
    sprite = Sprite('how_to_play.png');
    // sprite = Sprite('how_to_play2.png');
    rect = Rect.fromLTWH(
      game.tileSize * .25,
      game.screenSize.height - (game.tileSize * 2),
      game.tileSize * 1.6,
      game.tileSize * 2,
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
