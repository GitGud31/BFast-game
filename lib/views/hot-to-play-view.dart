import 'dart:ui';

import 'package:BFast/bfast-game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class HowToPlayView {
  final BFast game;
  Rect rect;
  Sprite sprite;

  TextPainter textPainter;
  TextStyle textStyle;
  Offset offset;

  HowToPlayView(this.game) {
    initText();
    rect = Rect.fromLTWH(
      game.tileSize,
      game.tileSize,
      (game.screenSize.width - 2 * game.tileSize),
      (game.screenSize.height - 2 * game.tileSize),
    );
    sprite = Sprite('how_to_play_screen.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
    textPainter.paint(canvas, offset);
  }

  void update(double timeDelta) {
    textPainter.text = TextSpan(text: 'HOW TO PLAY', style: textStyle);

    textPainter.layout();

    offset = Offset(game.tileSize * 2, game.tileSize * 2);
  }

  void initText() {
    offset = Offset.zero;

    textPainter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);

    textStyle = TextStyle(
        color: Color(0xffffffff),
        fontSize: 30,
        fontWeight: FontWeight.bold,
        shadows: <Shadow>[
          Shadow(blurRadius: 7, color: Color(0xff000000), offset: Offset(3, 3))
        ]);
  }
}
