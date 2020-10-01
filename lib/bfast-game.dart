import 'dart:ui';

import 'package:BFast/components/home-view.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';

import 'components/background.dart';
import 'views.dart';

class BFast extends Game {
  //screen
  Size screenSize;
  double tileSize;

  //Views
  Views activeView = Views.home;
  HomeView homeView;
  Background background;

  BFast(){
    initialize();
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);

    // if (activeView == Views.home) homeView.render(canvas);
  }

  @override
  void update(double t) {}

  void initialize() async{

    resize(await Flame.util.initialDimensions());

    background = Background(this);
    homeView = HomeView(this);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }
}
