import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

import '../bfast-game.dart';

class GetReadyView {
  final BFast game;
  Rect rect;
  Sprite sprite;

  TextPainter textPainter;
  TextStyle textStyle;
  Offset offset;

  GetReadyView(this.game) {
    initText();
    rect = Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
    sprite = Sprite('get_ready_screen.png');
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
    textPainter.paint(canvas, offset);
  }

  void update(double timeDelta) {
    textPainter.text = TextSpan(text: 'GET READY', style: textStyle);

    textPainter.layout();

    offset = Offset(game.tileSize * 1.5, game.screenSize.height / 4);
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
