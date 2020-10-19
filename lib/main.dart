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

  SharedPreferences scoreSaveMode2 = await SharedPreferences.getInstance();
  SharedPreferences scoreSaveMode3 = await SharedPreferences.getInstance();

  Flame.images.loadAll(<String>[
    'click_screen.png',
    'score_toosoon_screen.png',
    'wait_screen.png',
    'beehive.png',
    'get_ready_screen.png',
    'home_screen.png',
    'extra_screen.png',
    'callout.png',
    'how_to_play.png',
    'how_to_play2.png',
    'credits.png',
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
    'wasp5_wing_up.png',
    'wasp5_wing_down.png',
    'wasp5_dead.png',
    'long-grass.png',
    'mode_button.png',
    'logo_circle.png',
    'logo.png',
    'logo2.png',
    'logo3.png',
    'lost_screen.png',
    'sad_bee.png',
    'good_job_bee.png',
    'long_button.png',
    'click_screen2.png',
    'wait_screen2.png',
    'too_soon_screen.png',
    'score_screen.png',
    'lost_screen2.png',
    'play_again_long_button.png',
    'play_again_circle_button.png',
    'home_circle_button.png',
    'home_long_button.png',
    'start_circle_button.png',
    'start_long_button.png',
    'mode1_button.png',
    'mode2_button.png',
    'mode3_button.png',
    'mode4_button.png',
    'bee1.png',
    'bee2.png',
    'bee3.png',
    'bee4.png',
    'bee5.png',
    'beehive_3.png',
  ]);

  BFast game = BFast(scoreSaveMode2, scoreSaveMode3);
  runApp(game.widget);

  TapGestureRecognizer tapGesutureReconizer = TapGestureRecognizer();
  tapGesutureReconizer.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapGesutureReconizer);
}
