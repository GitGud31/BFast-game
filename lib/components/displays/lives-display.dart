import 'dart:ui';
import 'package:flutter/painting.dart';

import '../../bfast-game.dart';

class LivesDisplay {
  final BFast game;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  LivesDisplay(this.game) {
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

    updateLives();
  }

  void updateLives() {
    int livesLift = game.lives;

    painter.text = TextSpan(
      text: 'Lives: $livesLift',
      style: textStyle,
    );

    painter.layout();

    position = Offset(
      game.tileSize,
      game.tileSize * .25,
    );
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    if ((painter.text?.text ?? '') != game.lives.toString()) {
      painter.text =
          TextSpan(text: 'Lives: ' + game.lives.toString(), style: textStyle);

      painter.layout();

      position = Offset(20, game.tileSize * .25);
    }
  }
}
