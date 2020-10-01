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
    'buttons.png',
    'sprite_northWindShrineBG.png',
    'backyard.png',
    'logo.png',
  ]);

  BFast game = BFast();
  runApp(game.widget);

  TapGestureRecognizer tapGesutureReconizer = TapGestureRecognizer();
  tapGesutureReconizer.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapGesutureReconizer);

}
