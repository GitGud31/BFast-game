import 'dart:ui';
import 'package:flutter/painting.dart';

import '../../bfast-game.dart';

class ScoreDisplay {
  final BFast game;

  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  ScoreDisplay(this.game) {
    position = Offset.zero;

    painter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);

    textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 90,
      shadows: <Shadow>[
        Shadow(
          blurRadius: 7,
          color: Color(0xff000000),
          offset: Offset(3, 3),
        ),
      ],
    );
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    if ((painter.text?.text ?? '') != game.scoreMode2.toString()) {
      painter.text = TextSpan(
        text: game.scoreMode2.toString(),
        style: textStyle,
      );

      painter.layout();

      position = Offset(
        (game.screenSize.width / 2) - (painter.width / 2),
        (game.screenSize.height * .25) - (painter.height / 2),
      );
    }
  }
}
