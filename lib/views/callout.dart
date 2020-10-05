import 'dart:ui';

import 'package:BFast/components/wasp.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import '../bfast-game.dart';
import '../views.dart';

class Callout {
  final Wasp wasp;
  Rect rect;
  Sprite sprite;
  double value;

  TextPainter textPainter;
  TextStyle textStyle;
  Offset offset;

  Callout(this.wasp) {
    sprite = Sprite('callout.png');
    value = 1;
    textPainter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);

    textStyle = TextStyle(color: Color(0xff000000), fontSize: 15);
  }

  void render(Canvas canvas) {
    sprite.renderRect(canvas, rect);
    textPainter.paint(canvas, offset);
  }

  void update(double timeDelta) {
    if (wasp.game.activeView == Views.playing) {
      value = value - 0.5 * timeDelta;
      if (value <= 0) {
        //TODO: Implement sound.

        wasp.game.lives -= 1;
        wasp.isDead = true;
      }

      if (wasp.game.lives == 0) {
        wasp.game.activeView = Views.lost;
      }

      initText();
    }
  }

  void initText() {
    rect = Rect.fromLTWH(
      wasp.waspRect.left - (wasp.game.tileSize * .25),
      wasp.waspRect.top - (wasp.game.tileSize * .5),
      wasp.game.tileSize * .75,
      wasp.game.tileSize * .75,
    );

    textPainter.text = TextSpan(
      text: (value * 10).toInt().toString(),
      style: textStyle,
    );
    textPainter.layout();
    offset = Offset(
      rect.center.dx - (textPainter.width / 2),
      rect.top + (rect.height * .4) - (textPainter.height / 2),
    );
  }
}
