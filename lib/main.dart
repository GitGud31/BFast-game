import 'package:BFast/bfast-game.dart';
import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  //Todo: SharedPreferences

  //Todo: load assets
  Flame.images.loadAll(<String>[
    'click_screen.png',
    'score_screen.png',
    'wait_screen.png',
    'get_ready_screen.png',
    'home_screen.png',
    'too_soon_screen.png',
    'how_to_play_screen.png',
    'credits_screen.png',
    'logo.png',
    'Mode 1.png',
    'Mode 2.png',
    'Mode 3.png',
    'Mode 4.png',
    'home button.png',
    'play button.png',
    'play again button.png',
  ]);

  BFast game = BFast();
  runApp(game.widget);

  TapGestureRecognizer tapGesutureReconizer = TapGestureRecognizer();
  tapGesutureReconizer.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapGesutureReconizer);
}
