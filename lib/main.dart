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

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  Flame.images.loadAll(<String>[
    'click_screen.png',
    'score_toosoon_screen.png',
    'wait_screen.png',
    'get_ready_screen.png',
    'home_screen.png',
    'how_to_play_screen.png',
    'credits_screen.png',
    'Mode 1.png',
    'Mode 2.png',
    'Mode 3.png',
    'Mode 4.png',
    'home button.png',
    'play button.png',
    'play again button.png',
    'callout.png',
    'wasp1_wing_up.png',
    'wasp1_wing_down.png',
    'wasp1_dead.png',
    'wasp2_wing_up.png',
    'wasp2_wing_down.png',
    'wasp2_dead.png',
    'wasp3_wing_up.png',
    'wasp3_wing_down.png',
    'wasp3_dead.png',
    'wasp4_wing_up.png',
    'wasp4_wing_down.png',
    'wasp4_dead.png',
    'wasp5.png',
    'long-grass.png',
    'mode_button.png',
    'logo_circle.png',
    'lost_screen.png',
    'sad_bee.png',
    'good_job_bee.png',
    'long_button.png',
    'play_again_button.png',
  ]);

  BFast game = BFast(sharedPreferences);
  runApp(game.widget);

  TapGestureRecognizer tapGesutureReconizer = TapGestureRecognizer();
  tapGesutureReconizer.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapGesutureReconizer);
}
