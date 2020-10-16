import 'dart:ui';
import 'package:flutter/painting.dart';

import '../../bfast-game.dart';

class HighscoreDisplay {
  final BFast game;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  HighscoreDisplay(this.game) {
    position = Offset.zero;

    painter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);

    Shadow shadow =
        Shadow(blurRadius: 3, color: Color(0xff000000), offset: Offset.zero);

    textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 30,
      shadows: [shadow, shadow, shadow, shadow],
    );

    updateHighscore();
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void updateHighscore() {
    int highscore = game.sharedPreferences.getInt('highscore') ?? 0;

    painter.text = TextSpan(
      text: 'High-score: ' + highscore.toString(),
      style: textStyle,
    );

    painter.layout();

    position = Offset(
      game.screenSize.width - (game.tileSize * .25) - painter.width,
      game.tileSize * .25,
    );
  }
}
