import 'dart:ui';
import 'package:flutter/painting.dart';

import '../../bfast-game.dart';
import '../../modes.dart';

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
    print('${game.activeMode}');
    updateHighscore();
    painter.paint(c, position);
  }

  // void updateHighscore() {
  //   int highscore = game.scoreSaveMode2.getInt('highscore') ?? 0;

  //   painter.text = TextSpan(
  //     text: 'Highscore: ' + highscore.toString(),
  //     style: textStyle,
  //   );

  //   painter.layout();

  //   position = Offset(
  //     game.screenSize.width - (game.tileSize * .25) - painter.width,
  //     game.tileSize * .25,
  //   );
  // }

  void updateHighscore() {
    int highscore2 = game.scoreSaveMode2.getInt('highscore2') ?? 0;
    int highscore3 = game.scoreSaveMode3.getInt('highscore3') ?? 0;

    if (game.activeMode == Modes.mode0) {
      painter.text = TextSpan(text: '', style: textStyle);
      painter.layout();
      position = Offset(
          game.screenSize.width - (game.tileSize * .25) - painter.width,
          game.tileSize * .25);
    }
    if (game.activeMode == Modes.mode2) {
      painter.text = TextSpan(
          text: 'Highscore: ' + highscore2.toString(), style: textStyle);
      painter.layout();

      position = Offset(
        game.screenSize.width - (game.tileSize * .25) - painter.width,
        game.tileSize * .25,
      );
    }
    if (game.activeMode == Modes.mode3) {
      painter.text = TextSpan(
          text: 'Highscore: ' + highscore3.toString(), style: textStyle);
      painter.layout();

      position = Offset(
        game.screenSize.width - (game.tileSize * .25) - painter.width,
        game.tileSize * .25,
      );
    }
  }
}
