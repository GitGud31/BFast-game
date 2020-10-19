import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import '../../bfast-game.dart';

class ScoreView {
  final BFast game;
  Rect rect;
  Sprite sprite;

  TextPainter textPainter;
  TextStyle textStyle;
  Offset offset;

  ScoreView(this.game) {
    initText();
    rect = Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
    // sprite = Sprite('score_toosoon_screen.png');
    sprite = Sprite('score_screen.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
    textPainter.paint(canvas, offset);
  }

  void update(double timeDelta) {
    int score = game.stopwatchController.timeElapsed;
    textPainter.text = TextSpan(text: 'SCORE: $score ms', style: textStyle);
    textPainter.layout();
    offset = Offset(
      (game.screenSize.width / 2) - (textPainter.width / 2),
      (game.screenSize.height * .25) - (textPainter.height / 2),
    );
  }

  void initText() {
    offset = Offset.zero;

    textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 40,
      fontWeight: FontWeight.bold,
      shadows: <Shadow>[
        Shadow(
          blurRadius: 7,
          color: Color(0xff000000),
          offset: Offset(3, 3),
        ),
      ],
    );
  }
}
