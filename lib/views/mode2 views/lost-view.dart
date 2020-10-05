import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import '../../bfast-game.dart';

class LostView {
  final BFast game;
  Rect rect;
  Sprite sprite;

  TextPainter textPainter;
  TextStyle textStyle;
  Offset offset;

  LostView(this.game) {
    initText();
    rect = Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
    sprite = Sprite('lost_screen.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
    textPainter.paint(canvas, offset);
  }

  void update(double t) {
    textPainter.text = TextSpan(text: 'YOU LOST', style: textStyle);
    textPainter.layout();
    offset = Offset(game.tileSize / 2, game.screenSize.height / 4);
  }

  void initText() {
    offset = Offset.zero;

    textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 50,
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
