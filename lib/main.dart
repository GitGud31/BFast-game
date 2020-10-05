import 'package:BFast/bfast-game.dart';
import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  //Todo: SharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

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
    'callout.png',
    'wasp1.png',
    'wasp2.png',
    'wasp3.png',
    'wasp4.png',
    'wasp5.png',
    'long-grass.png',
    'mode_button.png',
    'logo_circle.png',
    'lost_screen.png',
  ]);

  BFast game = BFast(sharedPreferences);
  runApp(game.widget);

  TapGestureRecognizer tapGesutureReconizer = TapGestureRecognizer();
  tapGesutureReconizer.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapGesutureReconizer);
}
