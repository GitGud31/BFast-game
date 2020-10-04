import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import '../../bfast-game.dart';
import '../../views.dart';

class WaitView {
  final BFast game;
  Rect rect;
  Sprite sprite;

  TextPainter textPainter;
  TextStyle textStyle;
  Offset offset;

  WaitView(this.game) {
    initText();
    rect = Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
    sprite = Sprite('wait_screen.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
    textPainter.paint(canvas, offset);
  }

  void update(double timeDelta) {
    textPainter.text = TextSpan(text: 'WAIT', style: textStyle);
    textPainter.layout();
    offset = Offset(game.tileSize * 2.8, game.screenSize.height / 4);
  }

  void onTapDown() {
    game.randomTimerController.cancelRandomTimer();
    game.activeView = Views.tooSoon;
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
